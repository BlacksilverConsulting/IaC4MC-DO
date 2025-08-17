output "lotuscove_public_ip" {
  description = "The public IP address of lotuscove"
  value       = digitalocean_droplet.lotuscove.ipv4_address
}

output "lotuscove_test_public_ip" {
  description = "The public IP address of lotuscove-test"
  value       = length( digitalocean_droplet.lotuscove-test) > 0 ? digitalocean_droplet.lotuscove-test[0].ipv4_address : null
}
