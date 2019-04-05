# IBM Multicloud Manager on IBM Cloud Private clusters
Copyright IBM Corp. 2019, 2019 \
This code is released under the Apache 2.0 License.

## Overview
 This terraform template loads the IBM Multicloud Manager v 3.1.2 Docker images and Helm charts from an external binary (.tgz) into an existing ICP cluster. It requires access to the boot node of the cluster. After the execution of this template is done, two new helm charts named ibm-mcm-prod (MCM controller) and ibm-mcmk-prod (MCM klusterlet) will be available through the IBM Cloud Private catalog

## Prerequisites
* An existing IBM Cloud Private cluster where the MCM charts will be loaded into
* Location of the binary file that contains the MCM Docker images and Helm charts 

## Automation summary
The terraform template performs the following activities to install the MCM artifacts into an existing IBM Cloud Private cluster:
* connects to the ICP boot node and downloads the MCM .tgz in a temporary folder
* installs the kubectl, cloudctl and helm clients if not present 
* creates the MCM secrets
* runs the `cloudctl catalog load-ppa-archive` CLI which loads the Docker images and Helm charts into the ICP catalog

## Template input parameters
Parameter Name                                        | Parameter description
------------------------------------------------------|------------------------------------------------------------------
Boot Node IP Address| IP address of the ICP boot node
Boot Node User Name | User name used to connect to the boot node. Defaulted to `root`
Boot Node User Private SSH Key (optional)|Base64 encode private key used to connect to the boot node. Either the private key or the password needs to be provided in order to connect to the ICP boot node
Boot Node User Password (optional)|Password used to connect to the boot node. Either the private key or the password needs to be provided in order to connect to the ICP boot node
ICP Admin User Name| ICP admin user name. Defaulted to `admin`
ICP Admin User Password|ICP admin password
IBM Cloud Private Cluster Name| ICP cluster name (e.g. mycluster)
IBM Cloud Private Cluster CA Name|ICP cluster FQDN name (e.g. myclusyer.icp)
IBM Cloud Private Registry Server Name|Name of the Docker registry server running on the ICP boot node. Usually defaulted to the ICP CA name
MCM Download Location |MCM Download Location (http|https|ftp|file)
Repository User Name (Optional)| User name to connect to the MCM binary repository
Repository User Password (Optional)|User password to connect to the MCM binary repository
IBM MCM Secret Name (Optional)|Name of the MCM secret to be created on the ICP cluster. Defaulted to `mcm-secret`
