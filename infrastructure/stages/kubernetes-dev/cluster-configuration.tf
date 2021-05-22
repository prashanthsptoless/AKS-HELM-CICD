module "aks" {
  source = "github.com/jamesrcounts/phippyandfriends.git//infrastructure/modules/kubernetes?ref=azureaiconf.6.21"

  aks_subnet_cidr = data.azurerm_subnet.aks.address_prefixes.0
}