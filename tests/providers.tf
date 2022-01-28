provider "digitalocean" {
  token             = var.do_token
  spaces_access_id  = var.spaces_access_id
  spaces_secret_key = var.spaces_secret_key
}

provider "kubectl" {
  host                   = local.api_endpoint
  cluster_ca_certificate = local.certificate_authority_data
  token                  = local.token
  apply_retry_count      = 2
}
