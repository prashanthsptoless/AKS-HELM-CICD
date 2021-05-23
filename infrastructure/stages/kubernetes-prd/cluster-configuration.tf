module "aks" {
  source = "github.com/jamesrcounts/phippyandfriends.git//infrastructure/modules/kubernetes?ref=azureaiconf.6.21"

  aks_subnet_cidr             = data.azurerm_subnet.aks.address_prefixes.0
  backend_resource_group_name = var.backend_resource_group_name
  certificate_name            = "boss-crawdad-dev-jamesrcounts-com"
  configuration_keyvault_name = var.configuration_keyvault_name
}