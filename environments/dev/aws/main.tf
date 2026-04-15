
terraform {

  required_version = ">=1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.40.0"
    }
  }
  
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