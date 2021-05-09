module "aks_dev" {
  source = "github.com/jamesrcounts/phippyandfriends.git//infrastructure/modules/aks?ref=azureaiconf.6.21"

  environment             = "dev"
  instance_id             = local.instance_id
  log_analytics_workspace = azurerm_log_analytics_workspace.main
  resource_group          = data.azurerm_resource_group.rg
}