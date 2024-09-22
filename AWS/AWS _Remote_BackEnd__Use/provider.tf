terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.68.0"
    }
  }
  backend "s3" {
    bucket         = "terraformbackendpka"
    key            = "LockID"
    region         = "ap-south-2"
    dynamodb_table = "dynamo_demon"
  }
}

provider "aws" {
  # Configuration options
  region = "ap-south-2"
}
