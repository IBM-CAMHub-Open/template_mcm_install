module "klusterlet" {
  source  = "git::https://github.com/IBM-CAMHub-Open/template_mcm_modules.git?ref=3.2.0//mcm_klusterlet"
  
  kubernetes_service  = "iks"
  
  cluster_name                  = "${var.cluster_name}"
  cluster_config                = "${var.cluster_config}"
  cluster_certificate_authority = "${var.cluster_certificate_authority}"
  
  icp_url                       = "${var.icp_url}"
  icp_admin_user                = "${var.icp_admin_user}"
  icp_admin_password            = "${var.icp_admin_password}"
  mcm_hub_endpoint              = "${var.mcm_hub_endpoint}"
  remove_or_delete              = "${var.remove_or_delete}"
  
  bastion_host        = "${var.bastion_host}"
  bastion_user        = "${var.bastion_user}"
  bastion_private_key = "${var.bastion_private_key}"
  bastion_port        = "${var.bastion_port}"
  bastion_host_key    = "${var.bastion_host_key}"
  bastion_password    = "${var.bastion_password}"
}