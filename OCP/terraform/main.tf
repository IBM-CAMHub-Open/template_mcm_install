resource "random_string" "random-dir" {
  length  = 8
  special = false
}

module "cluster-credentials" {
  source  = "git::https://github.com/IBM-CAMHub-Open/template_mcm_modules.git?ref=3.2.1//cluster_credentials"
  
  cluster_type        = "ocp"
  work_directory      = "mcm${random_string.random-dir.result}"

  ## Details for accessing the target cluster
  cluster_name        = "${var.cluster_name}"
  ocp_url             = "${var.ocp_url}"
  ocp_admin_user      = "${var.ocp_admin_user}"
  ocp_admin_password  = "${var.ocp_admin_password}"

  ## Access to optional bastion host
  bastion_host        = "${var.bastion_host}"
  bastion_user        = "${var.bastion_user}"
  bastion_private_key = "${var.bastion_private_key}"
  bastion_port        = "${var.bastion_port}"
  bastion_host_key    = "${var.bastion_host_key}"
  bastion_password    = "${var.bastion_password}"
}

module "cluster-import" {
  source  = "git::https://github.com/IBM-CAMHub-Open/template_mcm_modules.git?ref=3.2.1//cluster_import"
  
  dependsOn           = "${module.cluster-credentials.credentials_generated}"
  work_directory      = "mcm${random_string.random-dir.result}"

  ## Details for accessing the MCM hub-cluster
  mcm_url             = "${var.mcm_url}"
  mcm_admin_user      = "${var.mcm_admin_user}"
  mcm_admin_password  = "${var.mcm_admin_password}"
  
  ## Details for accessing and importing the target cluster
  cluster_name        = "${var.cluster_name}"
  cluster_credentials = "${module.cluster-credentials.credentials_jsonfile}"
  cluster_namespace   = "${var.cluster_namespace}"

  ## If MCM image(s) are to be pulled from a private registry
  image_registry      = "${var.image_registry}"
  image_suffix        = "${var.image_suffix}"
  image_version       = "${var.image_version}"
  docker_user         = "${var.docker_user}"
  docker_password     = "${var.docker_password}"

  ## Access to optional bastion host
  bastion_host        = "${var.bastion_host}"
  bastion_user        = "${var.bastion_user}"
  bastion_private_key = "${var.bastion_private_key}"
  bastion_port        = "${var.bastion_port}"
  bastion_host_key    = "${var.bastion_host_key}"
  bastion_password    = "${var.bastion_password}"
}
