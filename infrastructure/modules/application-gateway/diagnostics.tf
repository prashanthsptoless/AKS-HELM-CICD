module "diagnostics" {
  source = "github.com/jamesrcounts/phippyandfriends.git//infrastructure/modules/diagnostics?ref=diagnostics-0.0.1"

  log_analytics_workspace_id = var.log_analytics_workspace.id

  monitored_services = {
    agw = azurerm_application_gateway.agw.id
    pip = azurerm_public_ip.agw.id
  }
}