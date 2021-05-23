resource "kubernetes_secret" "tls" {
  type = "kubernetes.io/tls"

  metadata {
    name = "ingress-tls"
  }

  data = {
    "tls.crt" = data.azurerm_key_vault_certificate.certificate.certificate_data_base64
    "tls.key" = data.azurerm_key_vault_certificate.certificate.certificate_data_base64
  }
}