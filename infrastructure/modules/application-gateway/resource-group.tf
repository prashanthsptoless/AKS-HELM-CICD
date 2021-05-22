# Assign roles for resources in the resource group.
resource "azurerm_role_assignment" "keyvault_secrets_user" {
  principal_id         = azurerm_user_assigned_identity.agw.principal_id
  role_definition_name = "Key Vault Secrets User"
  scope                = var.configuration_resource_group.id
}