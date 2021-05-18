module "diagnostics" {
  source = "github.com/jamesrcounts/phippyandfriends.git//infrastructure/modules/diagnostics?ref=azureaiconf.6.21"

  log_analytics_workspace_id = var.log_analytics_workspace.id

  monitored_services = {
    aks  = azurerm_kubernetes_cluster.aks.id
    vnet = azurerm_virtual_network.vnet.id
    kv   = azurerm_key_vault.ops.id
  }
}