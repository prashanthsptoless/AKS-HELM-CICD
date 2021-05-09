resource "azurerm_kubernetes_cluster" "aks" {
  dns_prefix          = local.aks_cluster_name
  kubernetes_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  location            = local.resource_group.location
  name                = local.aks_cluster_name
  node_resource_group = "${var.resource_group.name}-${var.environment}-aks"
  resource_group_name = local.resource_group.name
  tags                = var.resource_group.tags

  addon_profile {
    azure_policy { enabled = true }
    ingress_application_gateway {
      enabled     = true
      subnet_cidr = "10.2.0.0/16"
    }
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = local.log_analytics_workspace.id
    }
  }

  default_node_pool {
    availability_zones   = [1, 2, 3]
    enable_auto_scaling  = true
    max_count            = 3
    min_count            = 1
    name                 = "system"
    orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
    os_disk_size_gb      = 1024
    vm_size              = "Standard_DS2_v2"
    tags                 = var.resource_group.tags
  }

  identity { type = "SystemAssigned" }

  role_based_access_control {
    enabled = true
    azure_active_directory {
      managed                = true
      admin_group_object_ids = [azuread_group.aks_administrators.object_id]
    }
  }
}

