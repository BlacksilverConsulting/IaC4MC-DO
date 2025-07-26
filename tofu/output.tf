output "lotuscove_public_ip" {
  description = "The public IP address of the lotuscove DigitalOcean Droplet."
  value       = digitalocean_droplet.lotuscove.ipv4_address
}

