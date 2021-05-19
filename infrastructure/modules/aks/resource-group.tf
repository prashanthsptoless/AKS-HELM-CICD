# Assign roles for resources in the resource group.
resource "azurerm_role_assignment" "network_contributor" {
  principal_id         = azurerm_user_assigned_identity.aks.principal_id
  role_definition_name = "Network Contributor"
  scope                = local.resource_group.id
}

resource "azurerm_role_assignment" "keyvault_secrets_user" {
  principal_id         = azurerm_user_assigned_identity.agw.principal_id
  role_definition_name = "Key Vault Secrets User"
  scope                = local.resource_group.id
}