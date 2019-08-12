# MCM Klusterlet within Google Kubernetes Engine
Copyright IBM Corp. 2019, 2019 \
This code is released under the Apache 2.0 License.

## Overview
This terraform template imports an existing kubernetes cluster within the Google Cloud Kubernetes Engine (GKE) into a v3.2.0 MCM hub-cluster. \

## Prerequisites
* Tiller should not be installed within the kubernetes cluster

## Automation summary
The terraform template performs the following activities to import the specified GKE cluster into the MCM hub-cluster:
* Authenticates with the ICP server hosting the MCM hub-cluster
* Authenticates with Google Cloud
* Uses the given kubernetes cluster details to configure the import process
* Runs the import commands supported by the MCM hub-cluster

## Template input parameters

| Parameter Name        | Parameter Description | Required | Allowed Values
| :---                  | :--- | :--- | :--- |
| icp\_url              | URL, including port, for the ICP server hosting the MCM hub-cluster | true | |
| icp\_admin\_user      | User name for connecting to the ICP server | true | |
| icp\_admin\_password  | Password for connecting to the ICP server | true | |
| mcm\_hub\_endpoint    | The Kubernetes API endpoint of the IBM Multicloud Manager hub-cluster | true | |
| remove\_or\_delete    | When deployment is destroyed, 'remove' or 'delete' kubernetes cluster from MCM hub-cluster; Default is 'remove' | false | remove, delete |
| cluster_name          | Name of the deployed cluster within the kubernetes service | true | |
| cluster_config        | kubectl configuration text, Base64 encoded | true | |
| service\_account\_key | JSON-formatted key for admin service account associated with cluster, Base64 encoded | true | |