variable "backend_pool_ip_addresses" {
  description = "(Required) The IP addresses that make up the backend pool for this application gateway."
  type        = list(string)
}

variable "environment" {
  description = "(Required) The environment tag, examples: dev, tst, prd."
  type        = string
}

variable "hostname" {
  description = "(Required) The hostname to listen for requests on."
  type        = string
}

variable "instance_id" {
  description = "(Required) Unique ID for this instance."
  type        = string
}

variable "key_vault_secret_id" {
  description = "(Required) The key vault secret containing the TLS certificate for this instance."
  type        = string
}

variable "log_analytics_workspace" {
  description = "(Required) The module will use this log analytics workspace to configure diagnostics and Container Insights."
  type = object({
    id   = string
    name = string
  })
}

variable "resource_group" {
  description = "(Required) The module will deploy resources into this resource group and copy tags from this resource group onto the resources."
  type = object({
    id       = string
    name     = string
    location = string
    tags     = map(string)
  })
}

variable "subnet_id" {
  description = "(Required) The subnet id for the application gateway."
  type        = string
}