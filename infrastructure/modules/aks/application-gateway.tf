
# locals {
#   
#   http_setting_name              = "${local.application_gateway_name}-be-htst"
#   listener_name                  = "${local.application_gateway_name}-httplstn"
#   request_routing_rule_name      = "${local.application_gateway_name}-rqrt"
#   redirect_configuration_name    = "${local.application_gateway_name}-rdrcfg"

#   agw_listeners = {
#     gateway = {
#       certificate = azurerm_key_vault_certificate.apim["gateway"].secret_id
#       hostname    = local.gateway_hostname
#       path        = "/status-0123456789abcdef"
#       interval    = 30
#       timeout     = 120
#       threshold   = 8
#     }
#     portal = {
#       hostname    = local.portal_hostname
#       path        = "/internal-status-0123456789abcdef"
#       interval    = 60
#       timeout     = 300
#       threshold   = 8
#     }
#   }
# }

locals {
  backend_address_pool_name      = "aks"
  frontend_port_name             = "https"
  frontend_ip_configuration_name = "primary"

  agw_listeners = {
    aks = {
      certificate = azurerm_key_vault_certificate.cert.secret_id
      hostname    = local.hostname
    }
  }
}

resource "azurerm_application_gateway" "agw" {
  location            = local.resource_group.location
  name                = local.application_gateway_name
  resource_group_name = local.resource_group.name
  tags                = local.resource_group.tags

  backend_address_pool {
    name = local.backend_address_pool_name
  }

  dynamic "backend_http_settings" {
    for_each = local.agw_listeners

    content {
      cookie_based_affinity = "Disabled"
      name                  = backend_http_settings.key
      path                  = "/"
      port                  = 443
      #   probe_name            = backend_http_settings.key
      protocol        = "Https"
      request_timeout = 180
    }
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.agw.id]
  }

  #   dynamic "probe" {
  #     for_each = local.agw_listeners

  #     content {
  #       host                = probe.value.hostname
  #       interval            = probe.value.interval
  #       name                = probe.key
  #       path                = probe.value.path
  #       protocol            = "Https"
  #       timeout             = probe.value.timeout
  #       unhealthy_threshold = probe.value.threshold
  #     }
  #   }

  sku {
    name     = "WAF_v2"
    tier     = "WAF_v2"
    capacity = 1
  }

  gateway_ip_configuration {
    name      = "ip-01"
    subnet_id = azurerm_subnet.subnet["applicationgateway-subnet"].id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 443
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.agw.id
  }

  dynamic "http_listener" {
    for_each = local.agw_listeners

    content {
      frontend_ip_configuration_name = local.frontend_ip_configuration_name
      frontend_port_name             = local.frontend_port_name
      host_name                      = http_listener.value.hostname
      name                           = http_listener.key
      protocol                       = "Https"
      require_sni                    = true
      ssl_certificate_name           = http_listener.key
    }
  }

  dynamic "request_routing_rule" {
    for_each = local.agw_listeners

    content {
      name                       = request_routing_rule.key
      rule_type                  = "Basic"
      http_listener_name         = request_routing_rule.key
      backend_address_pool_name  = local.backend_address_pool_name
      backend_http_settings_name = request_routing_rule.key
    }
  }

  dynamic "ssl_certificate" {
    for_each = local.agw_listeners
    content {
      name                = ssl_certificate.key
      key_vault_secret_id = ssl_certificate.value.certificate
    }
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
}

