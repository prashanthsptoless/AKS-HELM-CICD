resource "azurerm_key_vault_certificate" "cert" {
  name         = replace(local.hostname, ".", "-")
  key_vault_id = azurerm_key_vault.ops.id
  tags         = local.resource_group.tags

  certificate {
    contents = filebase64("${var.certs_path}/${local.hostname}.pfx")
    password = var.cert_password
  }

  certificate_policy {
    issuer_parameters {
      name = "Unknown"
    }

    key_properties {
      exportable = true
      key_size   = 2048
      key_type   = "RSA"
      reuse_key  = false
    }

    lifetime_action {
      action {
        action_type = "EmailContacts"
      }

      trigger {
        lifetime_percentage = 50
      }
    }

    secret_properties {
      content_type = "application/x-pkcs12"
    }
  }
}
