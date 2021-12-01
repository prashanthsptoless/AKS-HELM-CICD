variable "aks_subnet_cidr" {
  description = "(Required) The CIDR range for the subnet configured for AKS nodes."
  type        = string
}

variable "tls" {
  description = "(Required) TLS cert and key data."
  type = object({
    cert = string
    key  = string
  })
}
