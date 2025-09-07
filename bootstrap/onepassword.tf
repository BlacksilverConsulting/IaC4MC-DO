
variable "vault" {
  description = "The UUID of the OnePassword Vault"
  type        = string
}

data "onepassword_item" "do_token" {
  vault = var.vault
  title = "Digital Ocean Full Access"
}

data "onepassword_item" "pbmac" {
  vault = var.vault
  title = "id_ed25519 on mac"
}

data "onepassword_item" "glowy" {
  vault = var.vault
  title = "blacksilver-consulting-20220410"
}

data "onepassword_item" "spaces" {
  vault = var.vault
  title = "DigitalOcean Spaces Access Key"
}
