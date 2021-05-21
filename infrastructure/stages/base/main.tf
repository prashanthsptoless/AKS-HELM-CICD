locals {
  instance_id = data.azurerm_resource_group.rg.tags["instance_id"]

  acr_pullers = {
    aks_dev_cluster = module.aks_dev.cluster_identity_principal_id
  }
}