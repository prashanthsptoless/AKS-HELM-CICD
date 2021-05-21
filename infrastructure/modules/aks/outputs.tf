output "cluster_identity_principal_id" {
  value = azurerm_user_assigned_identity.aks.principal_id
}

output "kubelet_identity_object_id" {
  value = azurerm_kubernetes_cluster.aks.kubelet_identity.0.object_id
}
