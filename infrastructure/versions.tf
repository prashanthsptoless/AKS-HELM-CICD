terraform {
  required_version = ">= 0.12"
  # backend "azurerm" {
  #   resource_group_name  = "terraformrg"
  #   storage_account_name = "terraform0fc88c88375d45c"
  #   container_name       = "terraform"
  #   key                  = "container-pipelines-demo.tfstate"
  # }
}

provider "azuread" {
  version = "~> 0.6"
}

provider "azurerm" {
  version = "~> 1.33"
}

provider "random" {
  version = "~> 2.2"
}