variable "environment" { type = string }

variable "log_analytics_workspace" {
  type = object({
    id   = string
    name = string
  })
}

variable "resource_group" {
  type = object({
    name     = string
    location = string
  })
}
