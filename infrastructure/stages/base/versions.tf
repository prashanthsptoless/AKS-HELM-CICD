terraform {
  required_version = ">= 0.15"
  backend "azurerm" {}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 1.4"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.58"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }
}

provider "azurerm" {
  subscription_id = var.env_subscription_id
  features {}
}

provider "azurerm" {
  alias = "ops"

  subscription_id = var.ops_subscription_id
  features {}
}

provider "aws" {
  region = "us-west-2"
}