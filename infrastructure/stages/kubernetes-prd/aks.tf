data "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-${local.instance_id}-prd"
  resource_group_name = data.azurerm_resource_group.env.name
}

data "azurerm_subnet" "aks" {
  name                 = "aks-subnet"
  virtual_network_name = "vnet-${data.azurerm_kubernetes_cluster.aks.name}"
  resource_group_name  = data.azurerm_resource_group.env.name
}