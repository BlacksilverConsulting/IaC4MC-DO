data "onepassword_item" "staff" {
  vault = var.vault
  title = "Lotus Cove Test - Staff"
}

resource "digitalocean_ssh_key" "staff" {
  name       = data.onepassword_item.staff.title
  public_key = data.onepassword_item.staff.public_key
}
