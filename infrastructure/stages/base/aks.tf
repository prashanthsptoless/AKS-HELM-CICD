module "aks" {
  source = "github.com/jamesrcounts/phippyandfriends.git//infrastructure/modules/aks?ref=azureai.2021.12"

  for_each = toset(["dev", "prd"])

  environment             = each.key
  instance_id             = local.instance_id
  log_analytics_workspace = data.azurerm_log_analytics_workspace.main
  resource_group          = data.azurerm_resource_group.rg
}