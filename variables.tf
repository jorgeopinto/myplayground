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

# chaves das vms que ficam disponiveis na pipeline. para nao ter no repositorio 
variable "aws_key_pub" {
  description = "chave public para maquina AWS"
  type        = string

}

variable "azure_key_pub" {
  description = "chave public para maquina Azure"
  type        = string

}