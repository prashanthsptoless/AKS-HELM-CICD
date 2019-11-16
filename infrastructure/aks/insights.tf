resource "azurerm_log_analytics_solution" "insights" {
  solution_name         = "ContainerInsights"
  location              = local.resource_group.location
  resource_group_name   = local.resource_group.name
  workspace_resource_id = local.log_analytics_workspace.id
  workspace_name        = local.log_analytics_workspace.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}