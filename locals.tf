locals {
  api_endpoint               = module.cluster.kube_config.0.host
  certificate_authority_data = base64decode(module.cluster.kube_config.0.cluster_ca_certificate)
  token                      = module.cluster.kube_config.0.token
  client_key                 = module.cluster.kube_config.0.client_key
  client_certificate         = module.cluster.kube_config.0.client_certificate
  suffix                     = random_string.suffix.result
  secret                     = random_string.secret.result
}
