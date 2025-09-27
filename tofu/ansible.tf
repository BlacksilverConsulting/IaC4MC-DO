resource "local_file" "ansible_inventory" {
  filename = "${path.module}/../ansible/hosts"
  content  = <<EOF
### BEGIN content from OpenTofu, do not edit manually ###
[minecraft]
${local.project} ansible_host=${digitalocean_record.minecraft_a.fqdn}
${var.backup_id != null ? "${local.project}-test ansible_host=${digitalocean_droplet.test[0].ipv4_address}" : ""}
### END content from OpenTofu, do not edit manually ###
EOF

  depends_on = [
    digitalocean_droplet.prod,
    digitalocean_droplet.test
  ]
  file_permission = "0744"
}

resource "local_file" "group_vars" {
  filename = "${path.module}/../ansible/group_vars/minecraft.yaml"
  content  = <<EOF
### BEGIN content from OpenTofu, do not edit manually ###
console_port: "${local.port.console}"
project: "${local.project}"
dns_name: "${digitalocean_record.minecraft_a.fqdn}"
### END content from OpenTofu, do not edit manually ###
EOF

  depends_on = [
    digitalocean_firewall.prod
  ]
  file_permission = "0744"
}

resource "local_file" "host_vars" {
  filename = "${path.module}/../ansible/host_vars/${local.project}"
  content  = <<EOF
### BEGIN content from OpenTofu, do not edit manually ###
server_port: "${local.port.mc}"
### END content from OpenTofu, do not edit manually ###
EOF

  depends_on = [
    digitalocean_firewall.prod
  ]
  file_permission = "0744"
}

