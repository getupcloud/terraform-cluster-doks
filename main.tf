resource "digitalocean_kubernetes_cluster" "cluster" {
  name          = var.name
  region        = var.region
  version       = var.kubernetes_version
  vpc_uuid      = var.vpc_uuid
  auto_upgrade  = var.auto_upgrade
  surge_upgrade = var.surge_upgrade
  tags          = var.tags

  node_pool {
    name       = try(var.node_pool.name, "infra")
    size       = try(var.node_pool.size, "s-4vcpu-8gb")
    auto_scale = try(var.node_pool.auto_scale, false)
    node_count = try(var.node_pool.node_count, "2")
    min_nodes  = try(var.node_pool.min_nodes, 2)
    max_nodes  = try(var.node_pool.max_nodes, 2)
    labels     = try(var.node_pool.labels, {})
    tags       = distinct(concat(var.tags, try(var.node_pool.tags, [])))

    taint {
      key    = try(var.node_pool.taint.key, null)
      value  = try(var.node_pool.taint.value, null)
      effect = try(var.node_pool.taint.effect, null)
    }
  }
}

resource "digitalocean_kubernetes_node_pool" "node_pool" {
  for_each = { for i, v in var.node_pools : v.name => v }

  cluster_id = digitalocean_kubernetes_cluster.cluster.id
  name       = try(each.value.name, "app-${each.key}")
  size       = try(each.value.size, "s-4vcpu-8gb")
  node_count = try(each.value.node_count, 2)
  auto_scale = try(each.value.auto_scale, true)
  min_nodes  = try(each.value.min_nodes, 2)
  max_nodes  = try(each.value.max_nodes, 4)
  labels     = try(each.value.labels, {})
  tags       = distinct(concat(var.tags, try(each.value.tags, [])))

  taint {
    key    = try(each.taint.key, null)
    value  = try(each.taint.value, null)
    effect = try(each.taint.effect, null)
  }
}

module "flux" {
  source = "github.com/getupcloud/terraform-module-flux?ref=main"

  git_repo       = var.flux_git_repo
  manifests_path = "./clusters/${var.name}/doks/manifests"
}
