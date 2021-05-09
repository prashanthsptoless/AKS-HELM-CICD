module "aks_dev" {
  source = "./aks"

  environment             = "dev"
  log_analytics_workspace = azurerm_log_analytics_workspace.main
  resource_group          = data.azurerm_resource_group.rg
}

module "aks_prod" {
  source = "./aks"

  environment             = "prod"
  log_analytics_workspace = azurerm_log_analytics_workspace.main
  resource_group          = data.azurerm_resource_group.rg
}

