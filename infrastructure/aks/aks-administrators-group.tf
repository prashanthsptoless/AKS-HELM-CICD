resource "azuread_group" "aks_administrators" {
  display_name = "${local.aks_cluster_name}-administrators"
  description  = "Kubernetes administrators for the ${local.aks_cluster_name} cluster."
}