terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.68.0"
    }
  }
  backend "s3" {
    bucket         = "terraformbackendpka" # Name of s3 bucket
    key            = "LockID"              # Partition key name "LockID"
    region         = "ap-south-2"          # Both create in same region
    dynamodb_table = "dynamo_demon"        # Name of the dynamodb_table
  }
}

provider "aws" {
  # Configuration options
  region = "ap-south-2"
}
