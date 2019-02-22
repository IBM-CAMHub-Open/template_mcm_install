#!/bin/bash

MCM_TAG=latest
while test $# -gt 0; do
  [[ $1 =~ ^-a|--action ]]  && { ACTION="${2}"; shift 2; continue; };
  [[ $1 =~ ^-c|--cluster ]] && { CLUSTER_NAME="${2}"; shift 2; continue; };
  [[ $1 =~ ^-m|--mcmtag ]]  && { MCM_TAG="${2}"; shift 2; continue; };
  [[ $1 =~ ^-s|--service ]] && { KUBE_SERVICE="${2}"; shift 2; continue; };
  [[ $1 =~ ^-w|--workdir ]] && { WORK_DIR="${2}"; shift 2; continue; };
  break;
done
MCM_IMAGE=ibmcom/mcm-inception-amd64
MCM_CONTROLLER_INFO=${WORK_DIR}/mcm-controller-info.txt


function pullImage() {
    echo "Pulling image ${MCM_IMAGE}:${MCM_TAG} from repository..."
    sudo docker pull ${MCM_IMAGE}:${MCM_TAG}
}

function prepareClusterDir() {
    cd ${WORK_DIR}

    # Prepare the directory to be used by the MCM inception container
    echo "Preparing directory ${WORK_DIR}/cluster for MCM inception container..."
    sudo rm -rf ${WORK_DIR}/cluster
    sudo docker run -v $(pwd):/data -e LICENSE=accept \
            ${MCM_IMAGE}:${MCM_TAG} cp -r /installer/cluster.${KUBE_SERVICE} /data/cluster
}

function installKlusterlet() {
    cd ${WORK_DIR}/cluster

    echo "Installing the MCM klusterlet into the kubernetes service cluster..."
    sudo docker run --net=host -t -e LICENSE=accept \
            -v "$(pwd)":/installer/cluster ${MCM_IMAGE}:${MCM_TAG} install-mcm-klusterlet -v
}

function uninstallKlusterlet() {
    cd ${WORK_DIR}/cluster

    echo "Uninstalling the MCM klusterlet from the kubernetes service cluster..."
    sudo docker run --net=host -t -e LICENSE=accept \
            -v "$(pwd)":/installer/cluster ${MCM_IMAGE}:${MCM_TAG} uninstall-mcm-klusterlet -v
}


function verifyIksInformation() {
    if [ ! -f ${IKS_CERTFILE} ]; then
        echo "IKS Cluster certificate authority is not available"
        exit 1
    fi
    if [ ! -f ${IKS_KUBEFILE} ]; then
        echo "IKS Cluster identification details are not available"
        exit 1
    fi
    if [ ! -f ${MCM_CONTROLLER_INFO} ]; then
        echo "MCM Controller connection details are not available"
        exit 1
    fi
}

function createIksZipFile() {
    cd ${WORK_DIR}

    echo "Renaming IKS certificate authority file..."
    certFile=`grep certificate-authority ${IKS_KUBEFILE} | cut -f2 -d':' | tr -d '[:space:]'`
    sudo cp ${IKS_CERTFILE} ${certFile}
    echo "Renamed IKS certificate authority file to ${certFile}"

    echo "Creating ZIP file containing IKS cluster access credentials..."
    sudo zip kubeconfig.zip ${certFile} ${IKS_KUBEFILE}
    sudo mv -f ./kubeconfig.zip ./cluster/kubeconfig
}

function setIksKlusterletConfiguration() {
    echo "Parsing IKS identification details from kubeconfig file..."
    cluster=`grep "cluster: .*" ${IKS_KUBEFILE} | cut -f2 -d':' | tr -d '[:space:]'`
    owner=`grep "user: .*" ${IKS_KUBEFILE} | cut -f2 -d':' | tr -d '[:space:]'`
    namespace="mcm-${CLUSTER_NAME}"
    endpoint=`grep "MCM_ENDPOINT: .*" ${MCM_CONTROLLER_INFO} | cut -f2 -d' ' | tr -d '[:space:]'`
    token=`grep "MCM_TOKEN: .*" ${MCM_CONTROLLER_INFO} | cut -f2 -d' ' | tr -d '[:space:]'`

    echo "Applying IKS details to MCM configuration file..."
    sudo sed -i -e "s!cluster-name:.*!cluster-name: ${cluster}!" \
                -e "s!cluster-namespace:.*!cluster-namespace: ${namespace}!" \
                -e "s!owner:.*!owner: \'${owner}\'!" \
                -e "s!hub-k8s-endpoint:.*!hub-k8s-endpoint: ${endpoint}!" \
                -e "s!hub-k8s-token:.*!hub-k8s-token: ${token}!" ${WORK_DIR}/cluster/config.yaml
}


if [ "${KUBE_SERVICE}" == "iks" ]; then
    echo "Preparing for MCM access the IKS cluster..."
    IKS_CERTFILE=${WORK_DIR}/ca-${CLUSTER_NAME}.pem
    IKS_KUBEFILE=${WORK_DIR}/kube-${CLUSTER_NAME}.yml
    verifyIksInformation
    pullImage
    prepareClusterDir
    createIksZipFile
    setIksKlusterletConfiguration
    if [ "${ACTION}" == "install" ]; then
        installKlusterlet
    elif [ "${ACTION}" == "uninstall" ]; then
        uninstallKlusterlet
    fi
fi
