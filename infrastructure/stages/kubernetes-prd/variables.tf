variable "resource_group_name" {
  description = "(Required) The name of the resource group for this project."
  type        = string
}

variable "env_subscription_id" {
  description = "(Required) The Azure subscription ID for the solution environment."
  type        = string
}

variable "ops_subscription_id" {
  description = "(Required) The subscription ID containing this project's ops resources"
  type        = string
}
