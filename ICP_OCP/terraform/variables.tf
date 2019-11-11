variable "import_launch_node_ip" {
  type = "string"
}

variable "vm_os_user" {
  type = "string"
}

variable "vm_os_password" {
  type = "string"
}

variable "vm_os_private_key" {
  type = "string"
}

variable "ocp_admin_user" {
  type = "string"
}

variable "ocp_admin_pass" {
  type = "string"
}

variable "ocp_server_url" {
  type = "string"
}

variable "man_cluster_on_hub" {
  type = "string"
}

variable "rhsm_user" {
  type = "string"
}

variable "rhsm_password" {
  type = "string"
}

variable "icp_admin_user" {
  type = "string"
}

variable "icp_admin_pass" {
  type = "string"
}

variable "icp_inception_image" {
  type = "string"
}

variable "icp_dir" {
  type = "string"
}

variable "cluster_name" {
  type = "string"
}

variable "cluster_docker_registry_server_name" {
  type = "string"
}

variable "cluster_docker_registry_server_port" {
  type = "string"
}

variable "cluster_docker_registry_server_ca_crt" {
  type = "string"
}

variable "cluster_docker_registry_server_ip" {
  type = "string"
}

variable "cluster_server_host" {
  type = "string"
}

###
#Kubeconfig DT variables
###
#variable "cluster_config" {
#  description = "kubeconfig details for managed cluster"
# default = ""
#}

#variable "cluster_certificate_authority" {
#  description = "Certificate for authenticating with managed cluster"
#  default = ""
#}

###
#Hub DT variables
###
variable "mcm_controller_server_name" {
  type = "string"
}

variable "mcm_controller_admin_user" {
  type = "string"
  default = "admin"
}

variable "mcm_controller_admin_user_password" {
  type = "string"
}