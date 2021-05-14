resource "azurerm_log_analytics_workspace" "main" {
  location            = data.azurerm_resource_group.rg.location
  name                = "la-${local.instance_id}"
  resource_group_name = data.azurerm_resource_group.rg.name
  retention_in_days   = 30
  sku                 = "PerGB2018"
  tags                = data.azurerm_resource_group.rg.tags
}

resource "azurerm_log_analytics_solution" "insights" {
  solution_name         = "ContainerInsights"
  location              = data.azurerm_resource_group.rg.location
  resource_group_name   = data.azurerm_resource_group.rg.name
  workspace_resource_id = azurerm_log_analytics_workspace.main.id
  workspace_name        = azurerm_log_analytics_workspace.main.name
  tags = data.azurerm_resource_group.rg.tags

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}