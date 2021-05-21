# Read details about the resource group created for this project.
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

# And the backend
data "azurerm_resource_group" "backend" {
  name = var.backend_resource_group_name
}

# Assign roles for resources in the resource group.
resource "azurerm_role_assignment" "acr_pull" {
  for_each = local.acr_pullers

  principal_id         = each.value
  role_definition_name = "AcrPull"
  scope                = data.azurerm_resource_group.backend.id
}