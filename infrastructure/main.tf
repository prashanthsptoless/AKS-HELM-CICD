locals {
  resource_location = "westus2"

  cluster_ids = [
    module.aks_dev.object_id,
    module.aks_prod.object_id,
  ]
}

provider "azuread" {
  version = "~> 0.6"
}

provider "azurerm" {
  version = "~> 1.33"
}



provider "random" {
  version = "~> 2.2"
}

