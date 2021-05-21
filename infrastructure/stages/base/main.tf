locals {
  instance_id = data.azurerm_resource_group.rg.tags["instance_id"]

  acr_pullers = {
    aks_dev         = module.aks_dev.kubelet_identity_object_id
    aks_dev_cluster = module.aks_dev.cluster_identity_principal_id
  }
}