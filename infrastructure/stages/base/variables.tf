variable "cert_password_dev" {
  description = "(Required) The password for the TLS certficate for the dev environment."
  sensitive   = true
  type        = string
}

variable "cert_password_prd" {
  description = "(Required) The password for the TLS certficate for the prd environment."
  sensitive   = true
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group for this project."
  type        = string
}