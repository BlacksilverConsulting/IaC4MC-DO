resource "local_file" "ansible_inventory" {
  filename = "${path.module}/../ansible/hosts"
  content  = <<EOF
[minecraft]
lotuscove ansible_host=${digitalocean_droplet.lotuscove.ipv4_address}
${var.backup_id != null ? "lotuscove-test ansible_host=${digitalocean_droplet.lotuscove-test[0].ipv4_address}" : ""}
EOF

  depends_on = [
    digitalocean_droplet.lotuscove,
    digitalocean_droplet.lotuscove-test
  ]
  file_permission = "0744"
}

resource "local_file" "group_vars" {
  filename = "${path.module}/../ansible/group_vars/minecraft.yaml"
  content  = <<EOF
console_port: "${local.port.console}"
EOF

  depends_on = [
    digitalocean_firewall.lotuscove-prod
  ]
  file_permission = "0744"
}
