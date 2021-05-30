data "azurerm_kubernetes_service_versions" "current" {
  location        = local.resource_group.location
  include_preview = false
}