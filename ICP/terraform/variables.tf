variable "vm_os_password" {
  type = "string"
}

variable "vm_os_private_key" {
  type = "string"
}

variable "vm_os_user" {
  type = "string"
}

#variable "private_ssh_key" {
#  type = "string"
#  default = "default"
#}

variable "mcm_version" {
  type = "string"
  default = "3.1.2"
}

variable "icp_version" {
  type = "string"
  default = "3.1.2"
}
 variable "icp_admin_user" {
  type = "string"
  default = "admin"
}
 variable "icp_admin_user_password" {
  type = "string"
}

variable "mcm_binary_url" {
  type = "string"
}

variable "download_user" {
  type = "string"
}

variable "download_user_password" {
  type = "string"
}

variable "cluster_location" {
  type = "string"
}

variable "cluster_name" {
  type = "string"
  default = "mycluser.icp"
}
variable "secret_name" {
  type = "string"
  default = "mcm-secret"
}
variable "master_node_ip" {
  type = "string"
}