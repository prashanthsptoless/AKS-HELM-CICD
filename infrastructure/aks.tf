module "aks_dev" {
  source = "./aks"

  environment             = "dev"
  log_analytics_workspace = azurerm_log_analytics_workspace.main
  resource_group          = azurerm_resource_group.main
}

module "aks_prod" {
  source = "./aks"

  environment             = "prod"
  log_analytics_workspace = azurerm_log_analytics_workspace.main
  resource_group          = azurerm_resource_group.main
}

