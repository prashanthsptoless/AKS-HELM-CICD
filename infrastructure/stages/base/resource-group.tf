# Read details about the resource group created for this project.
data "azurerm_resource_group" "rg" {
  name = "rg-${var.env_instance_id}"
}

data "azurerm_resource_group" "ops" {
  provider = azurerm.ops

  name = "rg-backend-${var.ops_instance_id}"
}

# Assign roles for resources in the resource group.
resource "azurerm_role_assignment" "acr_pull" {
  for_each = {
    for k, v in module.aks : k => v.kubelet_identity_object_id
  }

  principal_id         = each.value
  role_definition_name = "AcrPull"
  scope                = data.azurerm_resource_group.ops.id
}