module "aks_dev" {
  source = "github.com/jamesrcounts/phippyandfriends.git//infrastructure/modules/aks?ref=azureaiconf.6.21"

  cert_password           = data.azurerm_key_vault_secret.password["dev"].value
  certs_path              = "${path.module}/certs"
  environment             = "dev"
  instance_id             = local.instance_id
  log_analytics_workspace = azurerm_log_analytics_workspace.main
  resource_group          = data.azurerm_resource_group.rg
}

module "aks_prd" {
  source = "github.com/jamesrcounts/phippyandfriends.git//infrastructure/modules/aks?ref=azureaiconf.6.21"

  cert_password           = data.azurerm_key_vault_secret.password["prd"].value
  certs_path              = "${path.module}/certs"
  environment             = "prd"
  instance_id             = local.instance_id
  log_analytics_workspace = azurerm_log_analytics_workspace.main
  resource_group          = data.azurerm_resource_group.rg
}