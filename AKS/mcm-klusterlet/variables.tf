variable "docker_host" {
  description = "Docker host IP"
}

variable "user_name" {
  description = "User name"
}

variable "private_key" {
  description = "Private ssh key"
}

variable "cluster_name" {
  description = "Name of the Kubernetes Service cluster"
}

variable "cluster_config" {
  description = "kubectl configuration text, Base64 encoded"
}

variable "cluster_location" {
  description = "Location where Kubernetes Service cluster is installed"
}

variable "mcm_hub_endpoint" {
  description = "API endpoint of MCM hub cluster"
}

variable "mcm_hub_token" {
  description = "Authentication token for MCM hub cluster API endpoint"
}