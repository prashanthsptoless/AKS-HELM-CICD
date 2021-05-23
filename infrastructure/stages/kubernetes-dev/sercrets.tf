data "azurerm_resource_group" "config" {
  name = var.backend_resource_group_name
}

data "azurerm_key_vault" "config" {
  name                = var.configuration_keyvault_name
  resource_group_name = var.backend_resource_group_name
}

data "azurerm_key_vault_certificate" "certificate" {
  for_each = {
    dev = "boss-crawdad-dev-jamesrcounts-com"
    prd = "boss-crawdad-prd-jamesrcounts-com"
  }

  name         = each.value
  key_vault_id = data.azurerm_key_vault.config.id
}