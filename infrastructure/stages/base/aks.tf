module "aks_dev" {
  source = "github.com/jamesrcounts/phippyandfriends.git//infrastructure/modules/aks?ref=main"

  cert_secret_id               = data.azurerm_key_vault_certificate.certificate["dev"].secret_id
  environment                  = "dev"
  instance_id                  = local.instance_id
  log_analytics_workspace      = azurerm_log_analytics_workspace.main
  resource_group               = data.azurerm_resource_group.rg
  configuration_resource_group = data.azurerm_resource_group.config
}

module "aks_prd" {
  source = "github.com/jamesrcounts/phippyandfriends.git//infrastructure/modules/aks?ref=main"

  cert_secret_id               = data.azurerm_key_vault_certificate.certificate["prd"].secret_id
  environment                  = "prd"
  instance_id                  = local.instance_id
  log_analytics_workspace      = azurerm_log_analytics_workspace.main
  resource_group               = data.azurerm_resource_group.rg
  configuration_resource_group = data.azurerm_resource_group.config
}