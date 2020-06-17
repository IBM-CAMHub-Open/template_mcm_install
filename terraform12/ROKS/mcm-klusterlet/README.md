# IBM Cloud Pak for Multicloud Manager Klusterlet for RedHat OpenShift Kubernetes Service (ROKS) on IBM Cloud
Copyright IBM Corp. 2020, 2020
This code is released under the Apache 2.0 License.

## Overview
This terraform template imports an existing RedHat OpenShift Kubernetes Service cluster within the IBM Cloud into a IBM Cloud Pak for Multicloud Manager hub-cluster.

## Automation summary
The terraform template performs the following activities to import the specified ROKS cluster into the IBM Cloud Pak for Multicloud Manager hub-cluster:
* Authenticates with the IBM Cloud Pak for Multicloud Manager hub-cluster
* Uses the given Kubernetes cluster details to configure the import process
* Runs the import commands supported by the IBM Cloud Pak for Multicloud Manager hub-cluster

## Template input parameters

| Parameter Name                  | Parameter Description | Required |
| :---                            | :--- | :--- |
| mcm\_url                        | URL, including port, for the IBM CP4MCM hub-cluster | true |
| mcm\_admin\_user                | User name for connecting to the IBM CP4MCM API server | true |
| mcm\_admin\_password            | Password for connecting to the IBM CP4MCM API server | true |
| cluster_name                    | Name of the target ROKS cluster within the IBM CP4MCM hub. | true |
| cluster_namespace               | Namespace in the IBM CP4MCM hub cluster into which the target ROKS cluster will be imported; Defaults to cluster name | |
| cluster_config                  | kubectl configuration text, Base64 encoded | true |
| image_registry                  | URL for private docker registry from which klusterlet images will be pulled | |
| image_suffix                    | Suffix (e.g. -amd64), corresponding to the platform type, to be appended to image name | |
| image_version                   | Version/Tag (e.g 2.0.0 or latest) of the MCM image to be pulled | |
| docker_user                     | Username for authenticating with the private docker registry | |
| docker_password                 | Password for authenticating with the private docker registry | |