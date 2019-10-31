resource "azurerm_container_registry" "basic" {
  location            = local.resource_location
  name                = "containerpipelinesdemoacr"
  resource_group_name = azurerm_resource_group.main.name
  sku                 = "Basic"
}

