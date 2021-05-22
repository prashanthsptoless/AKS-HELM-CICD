module "agw" {
  source = "github.com/jamesrcounts/phippyandfriends.git//infrastructure/modules/application-gateway?ref=azureaiconf.6.21"

  environment             = var.environment
  hostname                = local.hostname
  instance_id             = var.instance_id
  key_vault_secret_id     = azurerm_key_vault_certificate.cert.secret_id
  log_analytics_workspace = var.log_analytics_workspace
  resource_group          = var.resource_group
  subnet_id               = azurerm_subnet.subnet["applicationgateway-subnet"].id

  backend_pool_ip_addresses = [
    cidrhost(azurerm_subnet.subnet["aks-subnet"].address_prefixes.0, 250)
  ]
}