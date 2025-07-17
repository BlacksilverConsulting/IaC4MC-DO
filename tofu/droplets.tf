locals {
  droplet = { agent = true, monitoring = true, size = "g-2vcpu-8gb" }
  backup  = { enable = true, plan = "daily", hour = "4" }
}

resource "digitalocean_droplet" "lotuscove" {
  image  = "centos-stream-9-x64"
  region = local.region
  size   = local.droplet.size

  name = "${local.project}1"

  ssh_keys = [data.terraform_remote_state.fsitma.outputs.pbmac_ssh_key_id,
              data.terraform_remote_state.fsitma.outputs.glowy_ssh_key_id ]

  droplet_agent = local.droplet.agent

  monitoring = local.droplet.monitoring

  backups = local.backup.enable

  backup_policy {
    plan = local.backup.plan
    hour = local.backup.hour
  }

}

resource "digitalocean_droplet" "lotuscove-test" {
  count  = var.backup_id != null ? 1 : 0
  image  = var.backup_id
  region = local.region
  size   = local.droplet.size

  name = "${local.project}2"

  ssh_keys = [data.terraform_remote_state.fsitma.outputs.pbmac_ssh_key_id,
              data.terraform_remote_state.fsitma.outputs.glowy_ssh_key_id ]

  droplet_agent = local.droplet.agent

  monitoring = local.droplet.monitoring

  backups = local.backup.enable

  backup_policy {
    plan = local.backup.plan
    hour = local.backup.hour
  }

}

