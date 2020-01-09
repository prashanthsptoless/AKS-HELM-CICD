resource "azurerm_log_analytics_workspace" "main" {
  location            = local.resource_location
  name                = "container-demo"
  resource_group_name = azurerm_resource_group.main.name
  retention_in_days   = 30
  sku                 = "PerGB2018"
}