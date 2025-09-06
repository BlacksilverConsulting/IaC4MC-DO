
data "onepassword_item" "do_token" {
  vault = local.op_vault_id
  title = "Digital Ocean Full Access"
}

data "onepassword_item" "pbmac" {
  vault = local.op_vault_id
  title = "id_ed25519 on mac"
}

data "onepassword_item" "glowy" {
  vault = local.op_vault_id
  title = "blacksilver-consulting-20220410"
}

data "onepassword_item" "spaces" {
  vault = local.op_vault_id
  title = "DigitalOcean Spaces Access Key"
}
