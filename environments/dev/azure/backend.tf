terraform {
  backend "azurerm" {
    resource_group_name  = "rg-JOP-P3"
    storage_account_name = "jorgepintotstate"
    container_name       = "remote-state"
    key                  = "quintadogato/terraform.tfstate"
  }
}