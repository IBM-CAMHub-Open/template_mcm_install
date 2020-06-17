variable "mcm_url" {
  description = "URL, including port, for the IBM CP4MCM hub cluster"
}

variable "mcm_admin_user" {
  description = "Username for connecting to the IBM CP4MCM hub cluster"
}

variable "mcm_admin_password" {
  description = "Password for authenticating with the IBM CP4MCM hub cluster"
}

variable "cluster_name" {
  description = "Name of the target ROKS cluster within the IBM CP4MCM hub."
}

variable "cluster_namespace" {
  description = "Namespace on the hub cluster into which the target cluster will be imported"
  default     = ""
}

variable "cluster_config" {
  description = "kubeconfig file contents (Base64 encoded) for ROKS cluster"
}

variable "image_registry" {
  description = "URL for private docker registry from which klusterlet images will be pulled"
  default     = ""
}

variable "image_suffix" {
  description = "Suffix (e.g. platform type) to be appended to image name"
  default     = ""
}

variable "image_version" {
  description = "Version (tag) of the MCM image to be pulled"
  default     = ""
}

variable "docker_user" {
  description = "Username for authenticating with the private docker registry"
  default     = ""
}

variable "docker_password" {
  description = "Password for authenticating with the private docker registry"
  default     = ""
}

