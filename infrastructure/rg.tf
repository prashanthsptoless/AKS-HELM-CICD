resource "azurerm_resource_group" "main" {
  location = local.resource_location
  name     = "container-pipelines-demo"

  tags = {
    environment = "Demos"
  }
}


