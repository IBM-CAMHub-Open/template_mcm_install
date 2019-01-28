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
  description = "Name of the IKS cluster"
}

variable "cluster_config" {
  description = "kubeconfig details for IKS cluster"
}

variable "cluster_certificate_authority" {
  description = "Certificate for authenticating with IKS cluster"
}

variable "mcm_hub_endpoint" {
  description = "API endpoint of MCM hub cluster"
}

variable "mcm_hub_token" {
  description = "Authentication token for MCM hub cluster API endpoint"
}
