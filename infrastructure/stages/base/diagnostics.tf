module "diagnostics" {
  source = "github.com/jamesrcounts/phippyandfriends.git//infrastructure/modules/diagnostics?ref=main"

  log_analytics_workspace_id = azurerm_log_analytics_workspace.main.id

  monitored_services = {
    la = azurerm_log_analytics_workspace.main.id
  }
}