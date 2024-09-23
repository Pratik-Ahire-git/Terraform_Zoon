terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.68.0"
    }
  }
  backend "s3" {
    bucket         = "backendbucketpka" # Name of s3 bucket
    key            = "LockID"           # Partition key name "LockID"
    region         = "us-east-1"        # Both create in same region
    dynamodb_table = "dynamoDB"         # Name of the dynamodb_table
  }
}

provider "aws" {
  # Configuration options
  region = "ap-south-2"
  default_tags {
    tags = {
      workspace : terraform.workspace
    }
  }

}
