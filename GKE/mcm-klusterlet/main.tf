
module "klusterlet" {
  source  = "git::https://github.com/IBM-CAMHub-Open/template_mcm_modules.git?ref=3.1.2//mcm_klusterlet"
  
  mcm_version         = "3.1.2-ce"
  kubernetes_service  = "gke"
  
  cluster_name        = "${var.cluster_name}"
  service_account_key = "${var.service_account_key}"
  cluster_location    = "${var.zone}"
  cluster_project     = "${var.project}"
  mcm_hub_endpoint    = "${var.mcm_hub_endpoint}"
  mcm_hub_token       = "${var.mcm_hub_token}"
  
  docker_host         = "${var.docker_host}"
  user_name           = "${var.user_name}"
  private_key         = "${var.private_key}"
  
  bastion_host        = "${var.bastion_host}"
  bastion_user        = "${var.bastion_user}"
  bastion_private_key = "${var.bastion_private_key}"
  bastion_port        = "${var.bastion_port}"
  bastion_host_key    = "${var.bastion_host_key}"
  bastion_password    = "${var.bastion_password}"
}