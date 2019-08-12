variable "icp_url" {
  description = "URL for ICP API Server"
}

variable "icp_admin_user" {
  description = "Username for connecting to the ICP API server"
}

variable "icp_admin_password" {
  description = "Password for connecting to the ICP API server"
}

variable "mcm_hub_endpoint" {
  description = "API endpoint for MCM hub cluster"
}

variable "remove_or_delete" {
  description = "When deployment is destroyed, 'remove' or 'delete' kubernetes cluster from MCM hub-cluster"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
}

variable "cluster_config" {
  description = "kubectl configuration text, Base64 encoded"
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
