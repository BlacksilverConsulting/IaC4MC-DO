resource "digitalocean_project" "lotuscove" {
  name        = local.project
  description = "Test environment for Lotus Cove"
  purpose     = "Shenanigans"
  environment = "Development"
  resources = concat(
    [
      digitalocean_droplet.lotuscove.urn
    ],
    [
      for droplet in digitalocean_droplet.lotuscove-test : droplet.id if length(digitalocean_droplet.lotuscove-test) > 0
    ]
  )
}
