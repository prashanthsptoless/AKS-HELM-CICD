module "aks" {
  source = "github.com/jamesrcounts/phippyandfriends.git//infrastructure/modules/kubernetes?ref=azureai.2021.12"

  aks_subnet_cidr = data.azurerm_subnet.aks.address_prefixes.0
  tls = {
    for k, v in data.azurerm_key_vault_secret.tls : k => v.value
  }
}


data "azurerm_resource_group" "config" {
  provider = azurerm.ops

  name = "rg-backend-${local.backend_instance_id}"
}

data "azurerm_key_vault" "config" {
  provider = azurerm.ops

  name                = "kv-${local.backend_instance_id}"
  resource_group_name = data.azurerm_resource_group.config.name
}

data "azurerm_key_vault_secret" "tls" {
  provider = azurerm.ops

  for_each = {
    cert = "prd-jamesrcounts-com-cert"
    key  = "prd-jamesrcounts-com-key"
  }

  key_vault_id = data.azurerm_key_vault.config.id
  name         = each.value
}