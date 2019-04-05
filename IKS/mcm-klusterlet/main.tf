## Generate unique ID for temporary work directory on docker host
resource "random_string" "random-dir" {
  length  = 8
  special = false
}


## Set up local variables to be used
locals {
  work_dir = "/tmp/mcm${random_string.random-dir.result}"
  kubeconfig_data  = "${length(var.cluster_config) > 0 ? base64decode(var.cluster_config) : var.cluster_config}"
  certificate_data = "${length(var.cluster_certificate_authority) > 0 ? base64decode(var.cluster_certificate_authority) : var.cluster_certificate_authority}"
  mcm_version = "3.1.2-ce"
}


resource "null_resource" "manage-klusterlet" {
  connection {
    type = "ssh"
    user = "${var.user_name}"
    private_key = "${length(var.private_key) > 0 ? base64decode(var.private_key) : var.private_key}"
    host = "${var.docker_host}"
  }
    
  provisioner "remote-exec" {
    inline = [
      "mkdir -p ${local.work_dir}"
    ]
  }

  provisioner "file" {
    source      = "${path.module}/scripts/manage_klusterlet.sh"
    destination = "${local.work_dir}/installKlusterlet.sh"
  }

  provisioner "file" {
    destination = "${local.work_dir}/kube-${var.cluster_name}.yml"
    content     = <<EOF
${local.kubeconfig_data}
EOF
  }

  provisioner "file" {
    destination = "${local.work_dir}/ca-${var.cluster_name}.pem"
    content     = <<EOF
${local.certificate_data}
EOF
  }

  provisioner "file" {
    destination = "${local.work_dir}/mcm-controller-info.txt"
    content     = <<EOF
MCM_ENDPOINT: ${var.mcm_hub_endpoint}
MCM_TOKEN: ${var.mcm_hub_token}
EOF
  }

  provisioner "remote-exec" {
    inline = [
      "set -e",
      "chmod 755 ${local.work_dir}/installKlusterlet.sh",
      "${local.work_dir}/installKlusterlet.sh -a install -m ${local.mcm_version} -s iks -w ${local.work_dir} -c ${var.cluster_name}",
      "sudo rm -rf ${local.work_dir}"
    ]
  }


  provisioner "remote-exec" {
    when   = "destroy"
    inline = [
      "mkdir -p ${local.work_dir}"
    ]
  }
  provisioner "file" {
    when        = "destroy"
    source      = "${path.module}/scripts/manage_klusterlet.sh"
    destination = "${local.work_dir}/uninstallKlusterlet.sh"
  }

  provisioner "file" {
    when        = "destroy"
    destination = "${local.work_dir}/kube-${var.cluster_name}.yml"
    content     = <<EOF
${local.kubeconfig_data}
EOF
  }

  provisioner "file" {
    when        = "destroy"
    destination = "${local.work_dir}/ca-${var.cluster_name}.pem"
    content     = <<EOF
${local.certificate_data}
EOF
  }

  provisioner "file" {
    when        = "destroy"
    destination = "${local.work_dir}/mcm-controller-info.txt"
    content     = <<EOF
MCM_ENDPOINT: ${var.mcm_hub_endpoint}
MCM_TOKEN: ${var.mcm_hub_token}
EOF
  }

  provisioner "remote-exec" {
    when   = "destroy"
    inline = [
      "set -e",
      "chmod 755 ${local.work_dir}/uninstallKlusterlet.sh",
      "${local.work_dir}/uninstallKlusterlet.sh -a uninstall -m ${local.mcm_version} -s iks -w ${local.work_dir} -c ${var.cluster_name}",
      "sudo rm -rf ${local.work_dir}"
    ]
  }
}
