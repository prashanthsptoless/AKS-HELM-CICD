module "diagnostics" {
  source = "github.com/jamesrcounts/phippyandfriends.git//infrastructure/modules/diagnostics?ref=azureaiconf.6.21"

  log_analytics_workspace_id = var.log_analytics_workspace.id

  monitored_services = {
    agw  = azurerm_application_gateway.agw.id
    aks  = azurerm_kubernetes_cluster.aks.id
    kv   = azurerm_key_vault.ops.id
    pip  = azurerm_public_ip.agw.id
    vnet = azurerm_virtual_network.vnet.id
  }
}