resource "azurerm_log_analytics_workspace" "main" {
  location            = local.resource_location
  name                = "la-${local.instance_id}"
  resource_group_name = data.azurerm_resource_group.rg.name
  retention_in_days   = 30
  sku                 = "PerGB2018"
}