provider "onepassword" {
  account     = "my.1password.com"
  op_cli_path = "/usr/local/bin/op"
}

provider "digitalocean" {
  token             = data.onepassword_item.do_token.password
  spaces_access_id  = data.onepassword_item.spaces.username
  spaces_secret_key = data.onepassword_item.spaces.password
}


