locals {
  # kube_config             = azurerm_kubernetes_cluster.main.kube_config.0
  aks_cluster_name        = "aks-${local.instance_id}-${local.environment}"
  environment             = var.environment
  instance_id             = var.instance_id
  log_analytics_workspace = var.log_analytics_workspace
  resource_group          = var.resource_group
}

# provider "kubernetes" {
#   version = "~> 1.9"

#   host                   = local.kube_config["host"]
#   client_certificate     = base64decode(local.kube_config["client_certificate"])
#   client_key             = base64decode(local.kube_config["client_key"])
#   cluster_ca_certificate = base64decode(local.kube_config["cluster_ca_certificate"])
# }


# provider "helm" {
#   version = "~> 0.10"

#   kubernetes {
#     host                   = local.kube_config["host"]
#     client_certificate     = base64decode(local.kube_config["client_certificate"])
#     client_key             = base64decode(local.kube_config["client_key"])
#     cluster_ca_certificate = base64decode(local.kube_config["cluster_ca_certificate"])
#   }
# }