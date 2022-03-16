locals {
  kubeconfig_filename        = abspath(pathexpand(var.kubeconfig_filename))
  api_endpoint               = digitalocean_kubernetes_cluster.cluster.kube_config.0.host
  token                      = digitalocean_kubernetes_cluster.cluster.kube_config.0.token
  certificate_authority_data = base64decode(digitalocean_kubernetes_cluster.cluster.kube_config.0.cluster_ca_certificate)
  client_certificate_data    = base64decode(digitalocean_kubernetes_cluster.cluster.kube_config.0.client_certificate)
  client_key_data            = base64decode(digitalocean_kubernetes_cluster.cluster.kube_config.0.client_key)

  #suffix                     = random_string.suffix.result
  #secret                     = random_string.secret.result
}
