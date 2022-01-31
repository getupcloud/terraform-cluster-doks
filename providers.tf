provider "kubectl" {
  host                   = local.api_endpoint
  cluster_ca_certificate = local.certificate_authority_data
  token                  = local.token
  apply_retry_count      = 2
}
