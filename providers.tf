terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.11.0"
    }

    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "~> 1"
    }
  }
}

provider "digitalocean" {
  token             = var.do_token
  spaces_access_id  = var.spaces_access_id
  spaces_secret_key = var.spaces_secret_key
}

provider "kubectl" {
  load_config_file       = false
  host                   = local.api_endpoint
  cluster_ca_certificate = local.certificate_authority_data
  token                  = local.token
  apply_retry_count      = 2
}
