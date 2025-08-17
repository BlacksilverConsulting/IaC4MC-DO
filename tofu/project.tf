resource "digitalocean_project" "lotuscove" {
  name        = local.project
  description = "Test environment for Lotus Cove"
  purpose     = "Shenanigans"
  environment = "Development"
  resources   = [digitalocean_droplet.lotuscove.urn]
}
