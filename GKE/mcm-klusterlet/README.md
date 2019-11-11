# MCM Klusterlet within Google Kubernetes Engine
Copyright IBM Corp. 2019, 2019
This code is released under the Apache 2.0 License.

## Overview
This terraform template imports an existing Kubernetes cluster within the Google Kubernetes Engine (GKE) into a v3.2.1 MCM hub-cluster.

## Prerequisites
* Tiller should not be installed within the Kubernetes cluster


## Automation summary
The terraform template performs the following activities to import the specified GKE cluster into the MCM hub-cluster:
* Authenticates with the MCM hub-cluster
* Uses the given Kubernetes cluster details to configure the import process
* Runs the import commands supported by the MCM hub-cluster

## Template input parameters

| Parameter Name                  | Parameter Description | Required |
| :---                            | :--- | :--- |
| mcm\_url                        | URL, including port, for the MCM hub-cluster | true |
| mcm\_admin\_user                | User name for connecting to the MCM API server | true |
| mcm\_admin\_password            | Password for connecting to the MCM API server | true |
| cluster_name                    | Name of the target cluster to be imported into the MCM hub cluster | true |
| cluster_namespace               | Namespace in the hub cluster into which the target cluster will be imported; Defaults to cluster name | |
| cluster_config                  | kubectl configuration text, Base64 encoded | true |
| service\_account\_credentials   | JSON-formatted key for admin service account associated with cluster, Base64 encoded | true |
| image_registry                  | URL for private docker registry from which klusterlet images will be pulled | |
| image_suffix                    | Suffix (e.g. -amd64), corresponding to the platform type, to be appended to image name | |
| image_version                   | Version/Tag (e.g 3.2.1 or latest) of the MCM image to be pulled | |
| docker_user                     | Username for authenticating with the private docker registry | |
| docker_password                 | Password for authenticating with the private docker registry | |