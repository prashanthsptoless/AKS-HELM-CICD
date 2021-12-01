variable "ops_instance_id" {
  description = "(Required) The instance ID for this project's ops resources."
  type        = string
}

variable "ops_subscription_id" {
  description = "(Required) The subscription ID containing this project's ops resources"
  type        = string
}

variable "env_instance_id" {
  description = "(Required) The instance ID for this project's resources."
  type        = string
}

variable "env_subscription_id" {
  description = "(Required) The Azure subscription ID for the solution environment."
  type        = string
}