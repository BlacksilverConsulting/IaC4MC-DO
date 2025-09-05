resource "digitalocean_domain" "minecraft" {
  name = local.domain
}

resource "digitalocean_record" "minecraft_a" {
  domain = digitalocean_domain.minecraft.id
  type   = "A"
  name   = "@"
  value  = digitalocean_droplet.prod.ipv4_address
  ttl    = local.ttl
}

resource "digitalocean_record" "www" {
  domain = digitalocean_domain.minecraft.id
  type   = "CNAME"
  name   = "www"
  value  = "${local.domain}."
  ttl    = local.ttl
}

resource "digitalocean_reserved_ip" "minecraft-test" {
  count      = var.backup_id != null ? 1 : 0
  droplet_id = digitalocean_droplet.test[0].id
  region     = local.region
}

resource "digitalocean_record" "test_a_record" {
  count  = var.backup_id != null ? 1 : 0
  domain = digitalocean_domain.minecraft.id
  type   = "A"
  name   = "test"
  value  = digitalocean_droplet.test[0].ipv4_address
  ttl    = local.ttl
}
