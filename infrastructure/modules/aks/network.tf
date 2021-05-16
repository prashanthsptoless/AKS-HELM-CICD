# Create virtual network
resource "azurerm_virtual_network" "vnet" {
  address_space       = ["10.0.0.0/8"]
  location            = data.azurerm_resource_group.rg.location
  name                = "vnet-${local.aks_cluster_name}"
  resource_group_name = data.azurerm_resource_group.rg.name
  tags                = data.azurerm_resource_group.rg.tags
}

# Create subnets
resource "azurerm_subnet" "subnet" {
  for_each = {
    "aks-subnet"                = cidrsubnet(azurerm_virtual_network.vnet.address_space.0, 8, 240)
    "applicationgateway-subnet" = cidrsubnet(azurerm_virtual_network.vnet.address_space.0, 8, 2)
  }

  address_prefixes     = [each.value]
  name                 = each.key
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
}
