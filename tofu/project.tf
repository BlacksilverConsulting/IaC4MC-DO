resource "digitalocean_project" "minecraft" {
  name        = local.project
  description = "Minecraft on Digital Ocean"
  purpose     = "Shenanigans"
  environment = "Development"
  resources = concat(
    [
      digitalocean_droplet.prod.urn
    ],
    [
      for droplet in digitalocean_droplet.test : droplet.urn if length(digitalocean_droplet.test) > 0
    ]
  )
}
