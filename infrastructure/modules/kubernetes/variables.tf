variable "aks_subnet_cidr" {
  description = "(Required) The CIDR range for the subnet configured for AKS nodes."
  type        = string
}

variable "backend_resource_group_name" {
  description = "(Required) The name of the resource group containing backend resources for this project."
  type        = string
}

variable "certificate_name" {
  description = "(Required) The name of the certificate stored in the backend configuration."
  type        = string
}

variable "configuration_keyvault_name" {
  description = "(Required) The name of the key vault containing configuration data."
  type        = string
}