output "prod_public_ip" {
  description = "The public IP address of the production server"
  value       = digitalocean_droplet.prod.ipv4_address
}

output "test_public_ip" {
  description = "The public IP address of the test server"
  value       = length(digitalocean_droplet.test) > 0 ? digitalocean_droplet.test[0].ipv4_address : null
}

output "console_port" {
  description = "The TCP port number for the console"
  value       = local.port.console
}
