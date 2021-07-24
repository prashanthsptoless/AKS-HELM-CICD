locals {
  instance_id         = data.azurerm_resource_group.rg.tags["instance_id"]
  backend_instance_id = data.azurerm_resource_group.rg.tags["backend_instance_id"]

  acr_pullers = {
    aks_dev_cluster = module.aks_dev.kubelet_identity_object_id
    aks_prd_cluster = module.aks_prd.kubelet_identity_object_id
  }
}