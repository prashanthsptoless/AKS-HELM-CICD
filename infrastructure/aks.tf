module "aks_dev" {
  source = "./aks"

  environment       = "dev"
  resource_group    = azurerm_resource_group.main.name
  resource_location = local.resource_location
}

module "aks_prod" {
  source = "./aks"

  environment       = "prod"
  resource_group    = azurerm_resource_group.main.name
  resource_location = local.resource_location
}

