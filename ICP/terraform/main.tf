provider "random" {
  version = "~> 1.0"
}

provider "local" {
  version = "~> 1.1"
}

provider "null" {
  version = "~> 1.0"
}

provider "tls" {
  version = "~> 1.0"
}

resource "random_string" "random-dir" {
  length  = 8
  special = false
}

resource "tls_private_key" "generate" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "null_resource" "create-temp-random-dir" {
  provisioner "local-exec" {
    command = "${format("mkdir -p  /tmp/%s" , "${random_string.random-dir.result}")}"
  }
}

module "mcm_install" {
  source                     = "git::https://github.com/IBM-CAMHub-Open/template_mcm_modules.git?ref=3.1.1//config_mcm_download"

  random                     = "${random_string.random-dir.result}"
  vm_os_user                 = "${var.vm_os_user}"
  private_key                = "${var.vm_os_private_key}"  
  vm_os_password             = "${var.vm_os_password}"
  master_ipv4_address        = "${var.master_node_ip}"
  mcm_binary_url             = "${var.mcm_binary_url}"
  download_user              = "${var.download_user}"
  download_user_password     = "${var.download_user_password}"
  cluster_name               = "${var.cluster_name}"
  cluster_ca_name            = "${var.cluster_ca_name}"
  cluster_docker_registry_server_name    = "${var.cluster_docker_registry_server_name}"  
  icp_user                   = "${var.icp_admin_user}"
  icp_user_password          = "${var.icp_admin_user_password}"
  secret_name                = "${var.secret_name}"
  #######
  bastion_host               = "${var.bastion_host}"
  bastion_user               = "${var.bastion_user}"
  bastion_private_key        = "${var.bastion_private_key}"
  bastion_port               = "${var.bastion_port}"
  bastion_host_key           = "${var.bastion_host_key}"
  bastion_password           = "${var.bastion_password}"  
}