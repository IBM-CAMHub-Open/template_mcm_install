# IBM Cloud Pak for Multicloud Manager Klusterlet within Kubernetes cluster
Copyright IBM Corp. 2020, 2020 
This code is released under the Apache 2.0 License.

## Overview
This terraform template is a generic template that imports an existing Kubernetes cluster into a OpenShift Container Platform v1.3.1 hub-cluster.

## Prerequisites
* Tiller should not be installed within the Kubernetes cluster

## Automation summary
The terraform template performs the following activities to import a Kubernetes cluster into the IBM Cloud Pak for Multicloud Manager hub-cluster hub-cluster:
* Authenticates with the IBM Cloud Pak for Multicloud Manager server hosting the hub-cluster
* Uses the given Kubernetes cluster details to configure the import process
* Runs the import commands supported by the IBM Cloud Pak for Multicloud Manager hub-cluster

## Template input parameters

| Parameter Name                  | Parameter Description | Required |
| :---                            | :--- | :--- |
| mcm\_url                        | URL, including port, for the MCM hub-cluster | true |
| mcm\_admin\_user                | User name for connecting to the MCM API server | true |
| mcm\_admin\_password            | Password for connecting to the MCM API server | true |
| cluster_name                    | Name of the target cluster to be imported into the MCM hub cluster | true |
| cluster_namespace               | Namespace in the hub cluster into which the target cluster will be imported; Defaults to cluster name | |
| cluster_endpoint                | URL for the target Kubernetes cluster endpoint | true |
| cluster_user                    | Username for accessing the target Kubernetes cluster | true |
| cluster_token                   | Token for authenticating with the target Kubernetes cluster | true |
| image_registry                  | URL for private docker registry from which klusterlet images will be pulled | |
| image_suffix                    | Suffix (e.g. -amd64), corresponding to the platform type, to be appended to image name | |
| image_version                   | Version/Tag (e.g 2.0.0 or latest) of the MCM image to be pulled | |
| docker_user                     | Username for authenticating with the private docker registry | |
| docker_password                 | Password for authenticating with the private docker registry | |
