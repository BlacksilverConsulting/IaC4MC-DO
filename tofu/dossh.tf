data "terraform_remote_state" "fsitma" {
  backend = "s3"

  config = { 
    endpoint = "${local.region}.digitaloceanspaces.com"
    bucket = "fsitma-tfstate"
    key    = "terraform-prod.tfstate"
    region = local.region
    skip_region_validation = true
    skip_credentials_validation = true
  }
}

