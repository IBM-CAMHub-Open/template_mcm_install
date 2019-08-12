variable "cluster_name" {
  description = "Name of the Kubernetes Service cluster"
}

variable "cluster_config" {
  description = "kubectl configuration text, Base64 encoded"
}

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
  description = "API endpoint of MCM hub cluster"
}

variable "remove_or_delete" {
  description = "When deployment is destroyed, 'remove' or 'delete' kubernetes cluster from MCM hub-cluster"
}

variable "service_account_credentials" {
  description = "Credentials for service account used to access the cluster (Base64-encoded)",
}