locals {
  environment       = var.environment
  kube_config       = azurerm_kubernetes_cluster.main.kube_config.0
  resource_group    = var.resource_group
  resource_location = var.resource_location
}

provider "kubernetes" {
  version = "~> 1.9"

  host                   = local.kube_config["host"]
  client_certificate     = base64decode(local.kube_config["client_certificate"])
  client_key             = base64decode(local.kube_config["client_key"])
  cluster_ca_certificate = base64decode(local.kube_config["cluster_ca_certificate"])
}


provider "helm" {
  version = "~> 0.10"

  kubernetes {
    host                   = local.kube_config["host"]
    client_certificate     = base64decode(local.kube_config["client_certificate"])
    client_key             = base64decode(local.kube_config["client_key"])
    cluster_ca_certificate = base64decode(local.kube_config["cluster_ca_certificate"])
  }
}