terraform {
  backend "s3" {
    bucket         = "mynops3"
    key            = "LockID"
    region         = "ap-south-2"
    dynamodb_table = "mydynano"

  }
}




provider "aws" {
  region = var.region
}

locals {
  cluster_name = "Nop_Cluster"
}