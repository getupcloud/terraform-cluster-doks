variable "name" {
  description = "Cluster name"
  type        = string
}

variable "kubeconfig_filename" {
  description = "Kubeconfig path"
  default     = "~/.kube/config"
  type        = string
}
