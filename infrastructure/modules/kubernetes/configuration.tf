data "azurerm_resource_group" "config" {
  name = var.backend_resource_group_name
}

data "azurerm_key_vault" "config" {
  name                = var.configuration_keyvault_name
  resource_group_name = var.backend_resource_group_name
}

data "azurerm_key_vault_certificate" "certificate" {
  key_vault_id = data.azurerm_key_vault.config.id
  name         = var.certificate_name
}

data "azurerm_key_vault_secret" "certificate_data" {
  key_vault_id = data.azurerm_key_vault.config.id
  name         = var.certificate_name
}