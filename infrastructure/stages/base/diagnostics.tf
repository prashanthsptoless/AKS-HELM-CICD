module "diagnostics" {
  source = "github.com/jamesrcounts/phippyandfriends.git//infrastructure/modules/diagnostics?ref=azureaiconf.6.21"

  log_analytics_workspace_id = azurerm_log_analytics_workspace.main.id

  monitored_services = {
    la = azurerm_log_analytics_workspace.main.id
  }
}