terraform {

  required_version = ">=1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.63.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "6.40.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-JOP-P3"
    storage_account_name = "jorgepintotstate"
    container_name       = "remote-state"
    key                  = "quintadogato/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

provider "aws" {
  region = "eu-central-1"
  default_tags {
    tags = {
      owner      = "jorgepinto"
      managed-by = "terraform"
    }
  }



}

#resource groups

resource "azurerm_resource_group" "quinta-do-gato" {
  name     = "rg-quinta-do-gato"
  location = var.WE

  tags = local.common_tags
}