resource "azurerm_user_assigned_identity" "agw" {
  location            = local.resource_group.location
  name                = "uai-${local.application_gateway_name}"
  resource_group_name = local.resource_group.name
  tags                = var.resource_group.tags
}