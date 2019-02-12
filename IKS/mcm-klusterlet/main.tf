## Generate unique ID for temporary work directory on docker host
resource "random_string" "random-dir" {
  length  = 8
  special = false
}


## Set up local variables to be used
locals {
  work_dir = "/tmp/mcm${random_string.random-dir.result}"
  kubeconfig_data  = "${length(var.cluster_config) > 0 ? base64decode(var.cluster_config) : var.cluster_config}"
  certificate_data = "${length(var.cluster_certificate_authority) > 0 ? base64decode(var.cluster_certificate_authority) : var.cluster_certificate_authority}"
}


## Create the temporary work directory
resource "null_resource" "create-work-dir" {
  connection {
    type = "ssh"
    user = "${var.user_name}"
    private_key = "${length(var.private_key) > 0 ? base64decode(var.private_key) : var.private_key}"
    host = "${var.docker_host}"
  }
    
  provisioner "remote-exec" {
    inline = [
      "mkdir -p ${local.work_dir}"
    ]
  }
}


## Prepare the MCM docker image and cluster configuration directory
resource "null_resource" "prep-cluster-dir" {
  depends_on = ["null_resource.create-work-dir",]

  connection {
    type = "ssh"
    user = "${var.user_name}"
    private_key = "${length(var.private_key) > 0 ? base64decode(var.private_key) : var.private_key}"
    host = "${var.docker_host}"
  }
    
  provisioner "remote-exec" {
    inline = [
      "set -e",
      "cd ${local.work_dir}",
      "sudo docker run -v $(pwd):/data -e LICENSE=accept ibmcom/mcm-inception-amd64:3.1.2-ce cp -r /installer/cluster.iks /data/cluster"
    ]
  }
}


## Create ZIP archive containing IKS cluster details
resource "null_resource" "create-zip" {
  depends_on = ["null_resource.prep-cluster-dir",]

  connection {
    type = "ssh"
    user = "${var.user_name}"
    private_key = "${length(var.private_key) > 0 ? base64decode(var.private_key) : var.private_key}"
    host = "${var.docker_host}"
  }
    
  provisioner "file" {
    destination = "${local.work_dir}/kube-${var.cluster_name}.yml"
    content     = <<EOF
${local.kubeconfig_data}
EOF
  }

  provisioner "file" {
    destination = "${local.work_dir}/ca-${var.cluster_name}.pem"
    content     = <<EOF
${local.certificate_data}
EOF
  }

  provisioner "remote-exec" {
    inline = [
      "set -e",
      "cd ${local.work_dir}",
      "sudo mv ca-${var.cluster_name}.pem `grep certificate-authority kube-${var.cluster_name}.yml | cut -f2 -d':' | tr -d '[:space:]'`",
      "sudo zip kubeconfig.zip *.pem *.yml",
      "sudo mv -f ./kubeconfig.zip ./cluster/kubeconfig"
    ]
  }
}


## Update MCM klusterlet configuration file with IKS details
resource "null_resource" "set-config" {
  depends_on = ["null_resource.create-zip",]

  connection {
    type = "ssh"
    user = "${var.user_name}"
    private_key = "${length(var.private_key) > 0 ? base64decode(var.private_key) : var.private_key}"
    host = "${var.docker_host}"
  }
    
  provisioner "file" {
    destination = "${local.work_dir}/setConfig.sh"
    content     = <<EOF
#!/bin/bash

WORKDIR=${local.work_dir}
KUBEFILE=kube-${var.cluster_name}.yml
KUBECONFIG=$${WORKDIR}/$${KUBEFILE}

cluster=`grep "cluster: .*" $${KUBECONFIG} | cut -f2 -d':' | tr -d '[:space:]'`
owner=`grep "user: .*" $${KUBECONFIG} | cut -f2 -d':' | tr -d '[:space:]'`
namespace=`grep "namespace: .*" $${KUBECONFIG} | cut -f2 -d':' | tr -d '[:space:]'`
endpoint=${var.mcm_hub_endpoint}
token=${var.mcm_hub_token}

sed -i -e "s!cluster-name:.*!cluster-name: $${cluster}!" \
       -e "s!cluster-namespace:.*!cluster-namespace: $${namespace}!" \
       -e "s!owner:.*!owner: \'$${owner}\'!" \
       -e "s!hub-k8s-endpoint:.*!hub-k8s-endpoint: $${endpoint}!" \
       -e "s!hub-k8s-token:.*!hub-k8s-token: $${token}!" $${WORKDIR}/cluster/config.yaml
EOF
  }

  provisioner "remote-exec" {
    inline = [
      "set -e",
      "cd ${local.work_dir}",
      "sudo chmod 755 setConfig.sh",
      "sudo ./setConfig.sh"
    ]
  }
}


## Run the MCM inception container
resource "null_resource" "run-inception" {
  depends_on = ["null_resource.set-config",]

  connection {
    type = "ssh"
    user = "${var.user_name}"
    private_key = "${length(var.private_key) > 0 ? base64decode(var.private_key) : var.private_key}"
    host = "${var.docker_host}"
  }
    
  provisioner "remote-exec" {
    inline = [
      "set -e",
      "cd ${local.work_dir}/cluster",
      "sudo docker run --net=host -t -e LICENSE=accept -v ${local.work_dir}/cluster:/installer/cluster ibmcom/mcm-inception-amd64:3.1.2-ce install-mcm-klusterlet -v"
    ]
  }
}
