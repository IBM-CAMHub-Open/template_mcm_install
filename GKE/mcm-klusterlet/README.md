# MCM Klusterlet within Google Kubernetes Engine
Copyright IBM Corp. 2019, 2019 \
This code is released under the Apache 2.0 License.

## Overview
This template deploys the IBM Multicloud Manager Klusterlet v3.1.2 into an existing kubernetes cluster managed within the Google Cloud Kubernetes Engine (GKE).

## Prerequisites
* The user must provide the IP address (or hostname), a login name and a SSH private key for connecting to a remote host
* The remote host must be capable of running docker commands, which will be used to deploy the MCM Klusterlet into the kubernetes cluster
* The user, identified by the given login credentials, should have 'sudo' permissions on the remote host
* To deploy the MCM Klusterlet, a JSON-formatted key associated with a Service Account within the Google Cloud is required
   - The 'Kubernetes Engine Admin' role must be assigned to the Service Account
   - The Service Account key must be provided to this template as a Base64-encoded input parameter

## Automation summary
The terraform template performs the following activities to install the MCM klusterlet into the specified GKE cluster:
* connects to the specified remote (docker) host and pulls the MCM inception container image from the docker repository
* uses the given GKE cluster details to configure the installation process
* runs, via docker, the MCM inception container to install the MCM klusterlet and register the clusterlet with the MCM hub-cluster

## Template input parameters

| Parameter Name        | Parameter Description |
| :---                  | :---        |
| docker_host           | Docker host IP address or hostname |
| user_name             | Login name for connecting to the docker host |
| private_key           | Private SSH key for connecting to the docker host, Base64 encoded |
| mcm\_hub\_endpoint    | The Kubernetes API endpoint of the IBM Multicloud Manager hub-cluster |
| mcm\_hub\_token       | The authentication token for the Kubernetes API endpoint of the IBM Multicloud Manager hub-cluster |
| cluster_name          | Name of the deployed cluster within the kubernetes service | 
| service\_account\_key | JSON-formatted Service Account key, Base64 encoded | 
| project               | Project within Google Cloud where kubernetes cluster is deployed | 
| zone                  | Zone within Google Cloud where kubernetes cluster is deployed | 
