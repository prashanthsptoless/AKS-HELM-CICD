module "diagnostics" {
  source = "github.com/jamesrcounts/phippyandfriends.git//infrastructure/modules/diagnostics?ref=diagnostics-0.0.1"

  log_analytics_workspace_id = var.log_analytics_workspace.id

  monitored_services = {
    aks  = azurerm_kubernetes_cluster.aks.id
    vnet = azurerm_virtual_network.vnet.id
  }
}