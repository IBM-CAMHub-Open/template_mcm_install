# IBM Multicloud Manager Klusterlet on IBM Cloud Private
Copyright IBM Corp. 2019, 2019 \
This code is released under the Apache 2.0 License.

## Overview
 This terraform template imports an existing IBM Cloud Private cluster to a IBM Multicloud Manager Controller (Hub Cluster).

## Prerequisites
* An existing IBM Cloud Private cluster.
* An existing IBM Multicloud Manager Controller (Hub Cluster).
* A VM to execute import command to import ICP to IBM MCM Controller (Hub Cluster).

## Automation summary
The terraform template performs the following activities:
* connects to the provided VM node and installs the kubectl, cloudctl and docker if not present.
* Sets up the kubernetes configuration for ICP cluster and IBM MCM Controller (Hub Cluster).
* runs the `cloudctl mc import` command to import a ICP cluster to the IBM MCM Controller (Hub Cluster).

## Template input parameters
Parameter Name                                        | Parameter description
------------------------------------------------------|------------------------------------------------------------------
Import Launch Node IP| IP address of the node to execute import of a ICP cluster to IBM MCM controller. This can be ICP boot node.
Import Launch Node User Name | The user name to connect to the import launch node.
Import Launch Node User Private SSH Key (optional)| Base64 encoded private SSH key to connect to the import launch node. Either the password or the private key should be provided.
Import Launch Node User Password (optional)| The user password to connect to the import launch node. Either the password or the private key should be provided.
Managed ICP Console Hostname or IP| IBM Cloud Private managed cluster console hostname or IP address. This hostname is used for downloading cloudctl and kubectl CLI for import.
Managed ICP Cluster Name| IBM Cloud Private Cluster Name on managed cluster.
Managed ICP Admin User Name| Managed ICP cluster administrator user name.
Managed ICP Admin Password| Managed ICP administrator password.
Managed ICP management console port| Management console port of ICP managed cluster. Default is 8443.
ICP Inception Image on managed cluster | Name of the bootstrap installation image on managed cluster. Default is ibmcom/icp-inception-amd64:3.2.0-ee.
Managed ICP Install Directory | Provide ICP Install Directory of managed cluster if the import launch node is boot or boot master node. If this value is not provided, config.yaml file used for installation would not be updated.
Managed ICP name to set on the target IBM MCM controller | Name that will be used to identify the managed ICP cluster on target IBM MCM Controller. If not provided a name would be generated based on cluster name.
