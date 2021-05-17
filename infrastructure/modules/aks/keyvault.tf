resource "azurerm_key_vault" "ops" {
  enable_rbac_authorization       = true
  enabled_for_deployment          = false
  enabled_for_disk_encryption     = false
  enabled_for_template_deployment = false
  location                        = local.resource_group.location
  name                            = "kv-${local.environment_id}"
  purge_protection_enabled        = false
  resource_group_name             = local.resource_group.name
  sku_name                        = "standard"
  soft_delete_retention_days      = 30
  tags                            = local.resource_group.tags
  tenant_id                       = data.azurerm_client_config.current.tenant_id
}