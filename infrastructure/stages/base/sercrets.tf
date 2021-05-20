data "azurerm_key_vault" "config" {
  name                = var.configuration_keyvault_name
  resource_group_name = var.backend_resource_group_name
}

data "azurerm_key_vault_secret" "password" {
  for_each = {
    dev = "cert-password-dev"
    prd = "cert-password-prd"
  }

  name         = each.value
  key_vault_id = data.azurerm_key_vault.config.id
}