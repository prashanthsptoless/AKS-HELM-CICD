data "azurerm_resource_group" "config" {
  name = var.backend_resource_group_name
}

data "azurerm_key_vault" "config" {
  name                = var.configuration_keyvault_name
  resource_group_name = var.backend_resource_group_name
}

data "azurerm_key_vault_secret" "tls" {
  for_each = {
    cert = "${var.certificate_name}-cert"
    key  = "${var.certificate_name}-key"
  }

  key_vault_id = data.azurerm_key_vault.config.id
  name         = each.value
}