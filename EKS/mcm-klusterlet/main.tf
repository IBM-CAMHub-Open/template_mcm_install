module "klusterlet" {
  source  = "git::https://github.com/IBM-CAMHub-Open/template_mcm_modules.git?ref=3.1.1//mcm_klusterlet"
  
  mcm_version         = "3.1.1-ce"
  kubernetes_service  = "eks"
  
  cluster_name        = "${var.cluster_name}"
  cluster_location    = "${var.aws_region}"
  access_key_id       = "${var.access_key_id}"
  access_key_secret   = "${var.secret_access_key}"
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