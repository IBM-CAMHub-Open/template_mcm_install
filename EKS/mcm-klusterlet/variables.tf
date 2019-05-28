variable "docker_host" {
  description = "Docker host IP"
}

variable "user_name" {
  description = "Login name for connecting to the remote host VM"
}

variable "private_key" {
  description = "SSH private key for login (Base64 encoded)"
}

variable "mcm_hub_endpoint" {
  description = "API endpoint for MCM hub cluster"
}

variable "mcm_hub_token" {
  description = "Authentication token for MCM hub cluster (Base64 encoded)"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
}

variable "aws_region" {
  description = "The region in which the EKS cluster is deployed"
}

variable "access_key_id" {
  description = "Access key ID for Amazon EC2 cloud"
}

variable "secret_access_key" {
  description = "Secret access key for Amazon EC2 cloud"
}