# IBM Multicloud Manager Klusterlet on IBM CLoud Private with OpenShift
Copyright IBM Corp. 2019, 2019 \
This code is released under the Apache 2.0 License.

## Overview
 This terraform template imports an existing IBM CLoud Private Cluster on OpenShift to a IBM Multicloud Manager Controller (Hub Cluster).

## Prerequisites
* An existing OpenShift cluster.
* An existing IBM Multicloud Manager Controller.
* A VM to execute import command to import OpenShift Cluster to IBM MCM Controller.

## Automation summary
The terraform template performs the following activities:
* connects to the provided VM node and installs the kubectl, cloudctl and docker if not present 
* Sets up the kubernetes configuration for OpenShift cluster and IBM MCM Controller
* runs the `cloudctl mc import` command to import the target OpenShift cluster to the IBM Multicloud Manager Controller

## Template input parameters
Parameter Name                                        | Parameter description
------------------------------------------------------|------------------------------------------------------------------
Import Launch Node IP| IP address of the node to execute import of a OpenShift cluster to IBM MCM Controller cluster. This can be a OpenShift installer master node.
Import Launch Node User Name | The user name to connect to the import launch node.
Import Launch Node User Private SSH Key (optional)| Base64 encoded private SSH key to connect to the import launch node. Either the password or the private key should be provided.
Import Launch Node User Password (optional)| The user password to connect to the import launch node. Either the password or the private key should be provided.
OpenShift Admin User Name | OpenShift administrator user name.
OpenShift Admin User Password | OpenShift administrator user password.
Managed cluster name on IBM MCM Controller | Name that will be used to identify the managed cluster on the IBM MCM Controller.
RedHat Subscription Manager user name | RedHat Subscription Manager user name for downloading OC CLI.
RedHat Subscription Manager user password | RedHat Subscription Manager user password for downloading OC CLI.
OpenShift Server URL | OpenShift Server URL with port. Example: https://a.b.c:8443
