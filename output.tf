output "id" {
  value = digitalocean_kubernetes_cluster.cluster.id
}

output "api_endpoint" {
  value = digitalocean_kubernetes_cluster.cluster.endpoint
}

output "cluster_subnet" {
  value = digitalocean_kubernetes_cluster.cluster.cluster_subnet
}

output "service_subnet" {
  value = digitalocean_kubernetes_cluster.cluster.service_subnet
}

output "ipv4_address" {
  value = digitalocean_kubernetes_cluster.cluster.ipv4_address
}

output "status" {
  value = digitalocean_kubernetes_cluster.cluster.status
}

output "kube_config" {
  value = digitalocean_kubernetes_cluster.cluster.kube_config[0]
}
