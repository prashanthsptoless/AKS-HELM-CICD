module "aks" {
  source = "github.com/jamesrcounts/phippyandfriends.git//infrastructure/modules/kubernetes?ref=kubernetes-0.0.1"

  aks_subnet_cidr             = data.azurerm_subnet.aks.address_prefixes.0
  backend_resource_group_name = "rg-backend-${local.backend_instance_id}"
  certificate_name            = "dev-jamesrcounts-com"
  configuration_keyvault_name = "kv-${local.backend_instance_id}"
}

