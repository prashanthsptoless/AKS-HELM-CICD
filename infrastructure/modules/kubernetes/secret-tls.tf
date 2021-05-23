locals {
  tls_data = base64encode(data.azurerm_key_vault_secret.certificate_data.value)
}

resource "kubernetes_secret" "tls" {
  type = "kubernetes.io/tls"

  metadata {
    name      = "ingress-tls"
    namespace = kubernetes_namespace.apps.metadata.0.name
  }

  data = {
    "tls.crt" = local.tls_data
    "tls.key" = local.tls_data
  }
}