locals {
  addr = {
    trusted = ["174.100.160.6/32", "104.2.157.7/32"],
    world   = ["0.0.0.0/0", "::/0"]
  }
  proto = { tcp = "tcp", udp = "udp", icmp = "icmp" }
  port  = { all = "1-65535", ssh = "22", console = "8080", mc = "25611", http = 80 }
}

resource "digitalocean_firewall" "prod" {
  name = "${local.project}-prod"

  droplet_ids = [digitalocean_droplet.prod.id]

  inbound_rule {
    protocol         = local.proto.tcp
    port_range       = local.port.ssh
    source_addresses = local.addr.trusted
  }

  inbound_rule {
    protocol         = local.proto.tcp
    port_range       = local.port.mc
    source_addresses = local.addr.world
  }

  inbound_rule {
    protocol         = local.proto.tcp
    port_range       = local.port.http
    source_addresses = local.addr.trusted
  }

  inbound_rule {
    protocol         = local.proto.tcp
    port_range       = local.port.console
    source_addresses = local.addr.trusted
  }

  outbound_rule {
    protocol              = local.proto.tcp
    port_range            = local.port.all
    destination_addresses = local.addr.world
  }

  outbound_rule {
    protocol              = local.proto.udp
    port_range            = local.port.all
    destination_addresses = local.addr.world
  }
}

resource "digitalocean_firewall" "test" {
  count = var.backup_id != null ? 1 : 0
  name  = "${local.project}-test"

  droplet_ids = [digitalocean_droplet.test[0].id]

  inbound_rule {
    protocol         = local.proto.tcp
    port_range       = local.port.ssh
    source_addresses = local.addr.trusted
  }

  inbound_rule {
    protocol         = local.proto.tcp
    port_range       = local.port.mc
    source_addresses = local.addr.trusted
  }

  outbound_rule {
    protocol              = local.proto.tcp
    port_range            = local.port.all
    destination_addresses = local.addr.world
  }

  outbound_rule {
    protocol              = local.proto.udp
    port_range            = local.port.all
    destination_addresses = local.addr.world
  }
}
