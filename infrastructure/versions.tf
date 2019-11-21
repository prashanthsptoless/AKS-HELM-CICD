terraform {
  required_version = ">= 0.12"
  backend "azurerm" {
    resource_group_name  = "terraformrg"
    storage_account_name = "terraform48b32a4177274ae"
    container_name       = "terraform"
    key                  = "container-pipelines-demo.tfstate"
  }
}
