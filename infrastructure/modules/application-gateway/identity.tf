resource "azurerm_user_assigned_identity" "agw" {
  location            = var.resource_group.location
  name                = "uai-${local.agw_name}"
  resource_group_name = var.resource_group.name
  tags                = var.resource_group.tags
}