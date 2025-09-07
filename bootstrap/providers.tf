variable "op_connect_token" {
  description = "Access token for 1Password Connect"
  type        = string
  sensitive   = true
}

provider "onepassword" {
  url   = "http://localhost:8080"
  token = var.op_connect_token
}

provider "digitalocean" {
  token             = data.onepassword_item.do_token.password
  spaces_access_id  = data.onepassword_item.spaces.username
  spaces_secret_key = data.onepassword_item.spaces.password
}


