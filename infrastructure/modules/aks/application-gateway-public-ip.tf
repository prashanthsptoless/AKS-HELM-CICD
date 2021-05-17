resource "azurerm_public_ip_prefix" "pib" {
  location            = local.resource_group.location
  name                = "pib-${local.environment_id}"
  prefix_length       = 31
  resource_group_name = local.resource_group.name
  sku                 = "Standard"
  tags                = local.resource_group.tags
}

resource "azurerm_public_ip" "agw" {
  allocation_method   = "Static"
  domain_name_label   = local.environment_id
  location            = local.resource_group.location
  name                = "pip-${local.application_gateway_name}"
  public_ip_prefix_id = azurerm_public_ip_prefix.pib.id
  resource_group_name = local.resource_group.name
  sku                 = "Standard"
  tags                = local.resource_group.tags
}