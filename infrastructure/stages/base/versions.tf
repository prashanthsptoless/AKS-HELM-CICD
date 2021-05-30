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
  features {}
}

provider "aws" {
  region = "us-west-2"
}