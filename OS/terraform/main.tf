module "mcm_import" {
  source                     			= "git::https://github.com/IBM-CAMHub-Open/template_mcm_modules.git?ref=3.2.0//config_mcm_oc_import"
  import_launch_node_ip          		= "${var.import_launch_node_ip}"
  vm_os_user                 			= "${var.vm_os_user}"
  vm_os_password             			= "${var.vm_os_password}"
  vm_os_private_key             		= "${var.vm_os_private_key}"  
  admin_user             				= "${var.admin_user}"
  admin_pass             				= "${var.admin_pass}"
  ocp_server_url             			= "${var.ocp_server_url}"
  man_cluster_on_hub            		= "${var.man_cluster_on_hub}"
  rhsm_user            					= "${var.rhsm_user}"          
  rhsm_password            				= "${var.rhsm_password}"  
  #######
  mcm_controller_server_name           	= "${var.mcm_controller_server_name}" 
  mcm_controller_admin_user             = "${var.mcm_controller_admin_user}"
  mcm_controller_admin_user_password    = "${var.mcm_controller_admin_user_password}"
  #######
  #cluster_config						= "${var.cluster_config}"
  #cluster_certificate_authority			= "${var.cluster_certificate_authority}"
  #######
  bastion_host               = "${var.bastion_host}"
  bastion_user               = "${var.bastion_user}"
  bastion_private_key        = "${var.bastion_private_key}"
  bastion_port               = "${var.bastion_port}"
  bastion_host_key           = "${var.bastion_host_key}"
  bastion_password           = "${var.bastion_password}"  
}