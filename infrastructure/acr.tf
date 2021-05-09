resource "azurerm_container_registry" "basic" {
  location            = local.resource_location
  name                = replace("cr-${local.instance_id}", "-", "")
  resource_group_name = data.azurerm_resource_group.rg.name
  sku                 = "Basic"
  tags                = data.azurerm_resource_group.rg.tags
}

resource "azurerm_role_assignment" "k8s_acrpull" {
  count = length(local.cluster_ids)

  principal_id         = local.cluster_ids[count.index]
  role_definition_name = "AcrPull"
  scope                = data.azurerm_resource_group.rg.id
}