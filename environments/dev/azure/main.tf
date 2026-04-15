terraform {

  required_version = ">=1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.63.0"
    }
  }
}

provider "azurerm" {
  features {}
}



module "networking" {
  source              = "../../../modules/azure/network"
  resource_group_name = "QDG_network_dev"
  HUB_VNET            = ["10.0.0.0/16"]
  Azure_Subnet_names = [
    "compute-subnet",
    "storage-subnet"
  ]
  Azure_Subnets_prefixes = [
    "10.0.1.0/24", #compute-subnet
    "10.0.2.0/24"  #storage-subnet
  ]
}

module "compute" {
  source              = "../../../modules/azure/compute"
  prefix              = "myapp-dev"
  resource_group_name = "QDG_network_dev"
  vm_size             = "Standard_D2s_v3"
  subnet_id           = module.networking.subnet_ids[0]
  admin_username      = "jorge"
}