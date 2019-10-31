resource "azurerm_kubernetes_cluster" "main" {
  depends_on = [azuread_application_password.credential]

  dns_prefix          = "containerpipelinesdemoaks"
  kubernetes_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  location            = local.resource_location
  name                = "container-pipelines-demo-aks"
  resource_group_name = azurerm_resource_group.main.name

  agent_pool_profile {
    name    = "default"
    vm_size = "Standard_DS1_v2"
  }

  service_principal {
    client_id     = azuread_service_principal.aks.application_id
    client_secret = random_uuid.password.result
  }
}

data "azurerm_kubernetes_service_versions" "current" {
  location = local.resource_location
}

