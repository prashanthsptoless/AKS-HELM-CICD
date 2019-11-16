resource "azurerm_container_registry" "basic" {
  location            = local.resource_location
  name                = "containerpipelinesdemoacr"
  resource_group_name = azurerm_resource_group.main.name
  sku                 = "Basic"
}

resource "azurerm_role_assignment" "k8s_acrpull" {
  count = length(local.cluster_ids)

  principal_id         = local.cluster_ids[count.index]
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.basic.id
}