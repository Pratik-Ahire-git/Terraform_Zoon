terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.67.0"
    }
  }
  cloud {                                               # To establish a connection between your Terraform configuration and Terraform Cloud

    organization = "learning_work"

    workspaces {
      name = "simple"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "ap-south-2"
  default_tags {
    tags = {
      Env = "Terraform"
    }
  }
}
