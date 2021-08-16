variable "do_token" {
  description = "DigitalOcean API Token"
}

variable "region" {
  description = "Region where to create cluster"
}

variable "spaces_access_id" {
  description = "Spaces Access Key ID for Backups"
  type        = string
  default     = null
}

variable "spaces_secret_key" {
  description = "Spaces Access Key ID for Backups"
  type        = string
  default     = null
}

variable "vpc_uuid" {
  description = "VPC UUID where to create cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.21.2-do.2"
}

variable "auto_upgrade" {
  description = "Should the cluster will be automatically upgraded to new patch releases during its maintenance window"
  default     = false
}

variable "surge_upgrade" {
  description = "Should upgrades bringing up new nodes before destroying the outdated nodes"
  default     = true
}

variable "node_pool" {
  description = "Default node pool config"
  default = {
    name       = "infra"
    size       = "s-4vcpu-8gb"
    node_count = 2
    auto_scale = false
    min_nodes  = 2
    max_nodes  = 2
    tags       = []

    labels = {
      role = "infra"
    }

    ## Format is list(taint): [{key:XXX, value: XXX, effect:XXX},...]
    taints = [{
      key    = "dedicated"
      value  = "infra"
      effect = "NoSchedule"
    }]
  }
}

variable "node_pools" {
  description = "List of node pools"
  default = [
    {
      name       = "app"
      size       = "s-4vcpu-8gb"
      node_count = 2
      auto_scale = true
      min_nodes  = 2
      max_nodes  = 4
      tags       = []

      labels = {
        role = "app"
      }

      ## Format is list(taint): [{key:XXX, value: XXX, effect:XXX},...]
      taints = []
    }
  ]
}

variable "tags" {
  description = "DO tags to apply to resources"
  type        = list(string)
  default     = []
}
