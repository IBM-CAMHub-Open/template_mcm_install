# Template - MCM Klusterlet within Amazon EC2 Kubernetes Service

## Description

This template deploys the IBM Multicloud Manager Klusterlet into an existing kubernetes cluster managed within the Amazon EC2 Kubernetes Service (EKS).<br>

## Features

### Clouds

Amazon EC2<br>
<br>
### Software Deployed

IBM Multicloud Manager Klusterlet v3.1.1<br>
<br>
### Usage and Special Notes

1. The user must provide the IP address (or hostname), a login name and a SSH private key for connecting to a remote host.<br>
2. The remote host must be capable of running docker commands, which will be used to deploy the MCM Klusterlet into the kubernetes cluster.<br>
3. The user, identified by the given login credentials, should have 'sudo' permissions on the remote host.<br>
<br>

### Parameters

| Name                  | Description |
| :---                  | :---        |
| docker_host           | Docker host IP address or hostname |
| user_name             | Login name for connecting to the docker host |
| private_key           | Private SSH key for connecting to the docker host, Base64 encoded |
| mcm\_hub\_endpoint    | The Kubernetes API endpoint of the IBM Multicloud Manager hub-cluster |
| mcm\_hub\_token       | The authentication token for the Kubernetes API endpoint of the IBM Multicloud Manager hub-cluster |
| cluster_name          | Name of the deployed cluster within the kubernetes service | 
| cluster_config        | kubectl configuration text, Base64 encoded | 
| access\_key\_id       | Access key ID to access the Amazon EC2 cloud | 
| access\_secret\_key   | Access Secret key to access the Amazon EC2 cloud | 

### License and Maintainer

Copyright IBM Corp. 2017, 2019 