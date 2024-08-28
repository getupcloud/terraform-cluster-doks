locals {
  kubeconfig_filename        = abspath(pathexpand(var.kubeconfig_filename))
  api_endpoint               = digitalocean_kubernetes_cluster.cluster.kube_config.0.host
  token                      = digitalocean_kubernetes_cluster.cluster.kube_config.0.token
  certificate_authority_data = base64decode(digitalocean_kubernetes_cluster.cluster.kube_config.0.cluster_ca_certificate)
  client_certificate_data    = base64decode(digitalocean_kubernetes_cluster.cluster.kube_config.0.client_certificate)
  client_key_data            = base64decode(digitalocean_kubernetes_cluster.cluster.kube_config.0.client_key)

  #suffix                     = random_string.suffix.result
  #secret                     = random_string.secret.result

  modules_result = {
    for name, config in merge(var.modules, local.modules) : name => merge(config, {
      output : config.enabled ? lookup(local.register_modules, name, try(config.output, tomap({}))) : tomap({})
    })
  }

  manifests_template_vars = merge(
    {
      doks : {
        region : var.region
        vpc_uuid : var.vpc_uuid
      }
    },
    var.manifests_template_vars,
    {
      alertmanager_cronitor_id : var.cronitor_id
      alertmanager_opsgenie_integration_api_key : var.opsgenie_integration_api_key
      modules : local.modules_result
    },
    module.teleport-agent.teleport_agent_config,
    { for k, v in var.manifests_template_vars : k => v if k != "modules" }
  )
}
