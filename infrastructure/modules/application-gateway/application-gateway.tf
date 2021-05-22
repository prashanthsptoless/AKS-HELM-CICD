resource "azurerm_application_gateway" "agw" {
  depends_on = [
    azurerm_role_assignment.keyvault_secrets_user
  ]

  location            = var.resource_group.location
  name                = local.agw_name
  resource_group_name = var.resource_group.name
  tags                = var.resource_group.tags

  autoscale_configuration {
    min_capacity = 0
    max_capacity = 3
  }

  backend_address_pool {
    name         = local.backend_address_pool_name
    ip_addresses = var.backend_pool_ip_addresses
  }

  backend_http_settings {
    cookie_based_affinity = "Disabled"
    name                  = "https"
    path                  = "/"
    port                  = 443
    #   probe_name            = backend_http_settings.key
    protocol        = "Https"
    request_timeout = 180
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.agw.id
  }

  frontend_port {
    name = "https"
    port = 443
  }

  frontend_port {
    name = "http"
    port = 80
  }

  gateway_ip_configuration {
    name      = "public"
    subnet_id = var.subnet_id
  }

  http_listener {
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = "https"
    host_name                      = var.hostname
    name                           = "https"
    protocol                       = "Https"
    require_sni                    = true
    ssl_certificate_name           = local.ssl_certificate_name
  }

  http_listener {
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = "http"
    host_name                      = var.hostname
    name                           = "http"
    protocol                       = "Http"
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.agw.id]
  }

  request_routing_rule {
    name                       = "https"
    rule_type                  = "Basic"
    http_listener_name         = "https"
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = "https"
  }

  request_routing_rule {
    name                        = "http"
    rule_type                   = "Basic"
    http_listener_name          = "http"
    redirect_configuration_name = "http-to-https"
  }

  redirect_configuration {
    name                 = "http-to-https"
    redirect_type        = "Permanent"
    target_listener_name = "https"
  }

  sku {
    name = "WAF_v2"
    tier = "WAF_v2"
  }

  ssl_certificate {
    name                = local.ssl_certificate_name
    key_vault_secret_id = var.key_vault_secret_id
  }

  ssl_policy {
    policy_type = "Predefined"
    policy_name = "AppGwSslPolicy20170401S"
  }

  waf_configuration {
    enabled          = true
    firewall_mode    = "Prevention"
    rule_set_type    = "OWASP"
    rule_set_version = "3.1"
  }

  zones = [1, 2, 3]
}


# locals {

#   agw_listeners = {
#     aks = {
#       certificate = azurerm_key_vault_certificate.cert.secret_id
#       hostname    = local.hostname
#     }
#   }
# }

# resource "azurerm_application_gateway" "agw" {
#   depends_on = [
#     azurerm_role_assignment.keyvault_secrets_user
#   ]

#   #   dynamic "probe" {
#   #     for_each = local.agw_listeners

#   #     content {
#   #       host                = probe.value.hostname
#   #       interval            = probe.value.interval
#   #       name                = probe.key
#   #       path                = probe.value.path
#   #       protocol            = "Https"
#   #       timeout             = probe.value.timeout
#   #       unhealthy_threshold = probe.value.threshold
#   #     }
#   #   }

# }

