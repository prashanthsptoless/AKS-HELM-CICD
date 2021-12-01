module "agw" {
  source = "github.com/jamesrcounts/phippyandfriends.git//infrastructure/modules/application-gateway?ref=application-gateway-0.0.1"
  for_each = {
    "dev" = "dev.jamesrcounts.com"
    "prd" = "prd.jamesrcounts.com"
  }

  environment                  = each.key
  hostname                     = each.value
  instance_id                  = local.instance_id
  key_vault_secret_id          = data.azurerm_key_vault_certificate.certificate[each.key].secret_id
  log_analytics_workspace      = data.azurerm_log_analytics_workspace.main
  resource_group               = data.azurerm_resource_group.rg
  configuration_resource_group = data.azurerm_resource_group.ops
  subnet_id                    = module.aks[each.key].subnet["applicationgateway-subnet"].id

  backend_pool_ip_addresses = [
    cidrhost(module.aks[each.key].subnet["aks-subnet"].address_prefixes.0, 250)
  ]
}