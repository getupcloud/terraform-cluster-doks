locals {
  api_endpoint               = digitalocean_kubernetes_cluster.cluster.kube_config.0.host
  certificate_authority_data = base64decode(digitalocean_kubernetes_cluster.cluster.kube_config.0.cluster_ca_certificate)
  token                      = digitalocean_kubernetes_cluster.cluster.kube_config.0.token
  client_key                 = digitalocean_kubernetes_cluster.cluster.kube_config.0.client_key
  client_certificate         = digitalocean_kubernetes_cluster.cluster.kube_config.0.client_certificate
  #  suffix                     = random_string.suffix.result
  #  secret                     = random_string.secret.result
}
