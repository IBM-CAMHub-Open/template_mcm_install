variable "mcm_url" {
  description = "URL, including port, for the MCM hub cluster",
}

variable "mcm_admin_user" {
  description = "Username for connecting to the MCM hub cluster"
}

variable "mcm_admin_password" {
  description = "Password for authenticating with the MCM hub cluster"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
}

variable "cluster_config" {
  description = "kubeconfig file contents (Base64 encoded) for Kubernetes cluster"
}


variable "access_key_id" {
  description = "Access key ID for Amazon EC2 cloud"
}

variable "secret_access_key" {
  description = "Secret access key for Amazon EC2 cloud"
}

variable "aws_region" {
  description = "The region in which the EKS cluster is deployed"
}

variable "cluster_namespace" {
  description = "Namespace on the hub cluster into which the target cluster will be imported"
  default = ""
}

variable "image_registry" {
  description = "URL for private docker registry from which klusterlet images will be pulled"
  default = ""
}

variable "image_suffix" {
  description = "Suffix (e.g. platform type) to be appended to image name"
  default = ""
}

variable "image_version" {
  description = "Version (tag) of the MCM image to be pulled"
  default = ""
}

variable "docker_user" {
  description = "Username for authenticating with the private docker registry"
  default = ""
}

variable "docker_password" {
  description = "Password for authenticating with the private docker registry"
  default = ""
}