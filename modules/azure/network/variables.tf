#Regions:
variable "WE" {
  description = "regiao dos recurso em Azure"
  type        = string
  default     = "West Europe"
}

variable "UKS" {
  description = "regiao de recursos em uk south"
  type        = string
  default     = "UK South"


}

#resource groups
variable "resource_group_name" {
  description = "nome resource group"
  type = string
  default = "quinta-do-gato"
  
}



# Estrutura VNET's
variable "HUB_VNET" {
  description = "VNET HUB Azure"
  type = list(string)
  default = ["10.0.0.0/16"]  
}

variable "Azure_Subnets_prefixes"{
  description =  "Azure Subnets"
  type = list(string)
}

variable "Azure_Subnet_names"{
  description =  "Azure Subnet name"
  type = list(string)
}
  