locals {
  resource_location = "westus2"
  kube_config       = azurerm_kubernetes_cluster.main.kube_config.0
}

provider "azuread" {
  version = "~> 0.6"
}

provider "azurerm" {
  version = "~> 1.33"
}

provider "kubernetes" {
  version = "~> 1.9"

  host                   = local.kube_config["host"]
  client_certificate     = base64decode(local.kube_config["client_certificate"])
  client_key             = base64decode(local.kube_config["client_key"])
  cluster_ca_certificate = base64decode(local.kube_config["cluster_ca_certificate"])
}

provider "random" {
  version = "~> 2.2"
}

