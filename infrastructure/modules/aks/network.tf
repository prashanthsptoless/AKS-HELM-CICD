# Create virtual network
resource "azurerm_virtual_network" "vnet" {
  address_space       = ["10.0.0.0/8"]
  location            = local.resource_group.location
  name                = "vnet-${local.aks_cluster_name}"
  resource_group_name = local.resource_group.name
  tags                = var.resource_group.tags
}

# Create subnets
resource "azurerm_subnet" "subnet" {
  for_each = {
    "aks-subnet"                = cidrsubnet(azurerm_virtual_network.vnet.address_space.0, 8, 240)
    "applicationgateway-subnet" = cidrsubnet(azurerm_virtual_network.vnet.address_space.0, 8, 2)
  }

  address_prefixes     = [each.value]
  name                 = each.key
  resource_group_name  = local.resource_group.name
  virtual_network_name = azurerm_virtual_network.vnet.name
}
