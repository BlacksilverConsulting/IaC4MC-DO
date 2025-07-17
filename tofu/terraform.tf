locals {
  # State bucket
  state_bucket = "${local.project}-tfstate-${local.uniq}"
}

terraform {
  required_version = ">= 1.8.8"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2"
    }
    onepassword = {
      source  = "1Password/onepassword"
      version = "~> 2.1"
    }
  }
  backend "s3" {
    endpoint = "${local.region}.digitaloceanspaces.com"
    bucket   = local.state_bucket
    key      = "terraform.tfstate"
    region   = local.region
    # Skips required by DigitalOcean:
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
