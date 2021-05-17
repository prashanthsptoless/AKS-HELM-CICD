locals {
  aks_cluster_name         = "aks-${local.environment_id}"
  aks_node_labels          = { for k, v in var.resource_group.tags : k => replace(v, "/", ".") }
  application_gateway_name = "agw-${local.environment_id}"
  environment_id           = "${local.instance_id}-${var.environment}"
  instance_id              = var.instance_id
  log_analytics_workspace  = var.log_analytics_workspace
  resource_group           = var.resource_group
}
