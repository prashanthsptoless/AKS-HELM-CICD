resource "azurerm_kubernetes_cluster" "main" {
  dns_prefix          = "${local.environment}-container-demo"
  kubernetes_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  location            = local.resource_location
  name                = "${local.environment}-container-demo"
  resource_group_name = local.resource_group

  agent_pool_profile {
    name    = "default"
    vm_size = "Standard_DS1_v2"
    count = 2
  }

  service_principal {
    client_id     = module.service_principal.application_id
    client_secret = module.service_principal.client_secret
  }
}

data "azurerm_kubernetes_service_versions" "current" {
  location = local.resource_location
}