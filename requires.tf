terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.11.1"
    }

    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "~> 1"
    }

    shell = {
      source  = "scottwinkler/shell"
      version = "~> 1"
    }
  }
}
