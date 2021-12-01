provider "azurerm" {
  subscription_id = var.env_subscription_id

  features {}
}

provider "azurerm" {
  alias           = "ops"
  subscription_id = var.ops_subscription_id

  features {}
}

provider "kubernetes" {
  host                   = local.kube_config["host"]
  client_certificate     = base64decode(local.kube_config["client_certificate"])
  client_key             = base64decode(local.kube_config["client_key"])
  cluster_ca_certificate = base64decode(local.kube_config["cluster_ca_certificate"])
}

provider "helm" {
  kubernetes {
    host                   = local.kube_config["host"]
    client_certificate     = base64decode(local.kube_config["client_certificate"])
    client_key             = base64decode(local.kube_config["client_key"])
    cluster_ca_certificate = base64decode(local.kube_config["cluster_ca_certificate"])
  }
}
