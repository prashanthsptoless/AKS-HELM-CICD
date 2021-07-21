locals {
  kube_config         = data.azurerm_kubernetes_cluster.aks.kube_admin_config.0
  instance_id         = data.azurerm_resource_group.env.tags["instance_id"]
  backend_instance_id = data.azurerm_resource_group.env.tags["backend_instance_id"]
}