resource "azurerm_kubernetes_cluster" "main" {
  dns_prefix          = "${local.environment}-container-demo"
  kubernetes_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  location            = local.resource_group.location
  name                = "${local.environment}-container-demo"
  resource_group_name = local.resource_group.name

  addon_profile {
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = local.log_analytics_workspace.id
    }
  }

  default_node_pool {
    availability_zones = [1, 2, 3]
    name               = "default"
    node_count         = 3
    vm_size            = "Standard_DS1_v2"
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "Standard"
  }

  service_principal {
    client_id     = module.service_principal.application_id
    client_secret = module.service_principal.client_secret
  }
}

data "azurerm_kubernetes_service_versions" "current" {
  location = local.resource_group.location
}