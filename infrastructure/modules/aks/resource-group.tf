# Assign roles for resources in the resource group.
resource "azurerm_role_assignment" "network_contributor" {
  principal_id         = azurerm_user_assigned_identity.aks.object_id
  role_definition_name = "Network Contributor"
  scope                = local.resource_group.id
}