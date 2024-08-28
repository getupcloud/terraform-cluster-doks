terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.11"
    }

    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "~> 1"
    }

    kubernetes = {
      version = "~> 2.8"
    }

    kustomization = {
      source  = "kbst/kustomization"
      version = "< 1"
    }

    random = {
      version = "~> 2"
    }

    shell = {
      source  = "scottwinkler/shell"
      version = "~> 1"
    }
  }
}

provider "kustomization" {
  kubeconfig_raw = ""
}

provider "digitalocean" {
  token             = "token"
  spaces_access_id  = "spaces_access_id"
  spaces_secret_key = "spaces_secret_key"
}

module "cluster" {
  source = "../"

  region = "region"
  cluster_name = "cluster_name"
  customer_name = "customer_name"
  vpc_uuid = "vpc_uuid"
  do_token = "do_token"
}
