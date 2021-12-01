locals {
  instance_id     = data.azurerm_resource_group.rg.tags["instance_id"]
  ops_instance_id = data.azurerm_resource_group.ops.tags["instance_id"]
}