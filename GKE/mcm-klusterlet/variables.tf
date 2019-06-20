variable "docker_host" {
  description = "Docker host IP"
}

variable "user_name" {
  description = "User name"
}

variable "private_key" {
  description = "Private ssh key"
}

variable "mcm_hub_endpoint" {
  description = "API endpoint of MCM hub cluster"
}

variable "mcm_hub_token" {
  description = "Authentication token for MCM hub cluster API endpoint"
}

variable "cluster_name" {
  description = "Name of the Kubernetes Service cluster"
}

variable "service_account_key" {
  description = "JSON-formatted Service Account key, Base64 encoded"
}

variable "project" {
  description = "Google Cloud project ID"
}

variable "zone" {
  description = "The zone in which the GKE cluster is deployed"
}
