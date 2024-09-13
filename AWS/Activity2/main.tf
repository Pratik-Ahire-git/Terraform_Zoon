resource "aws_vpc" "Example" {
  cidr_block       = var.vpc-cidr_block
  instance_tenancy = "default"
  tags = {
    Name = var.vpc-tag-Name
  }
}

resource "aws_subnet" "subnet-1" {
  vpc_id            = aws_vpc.Example.id
  cidr_block        = var.subnet-1-cidr_block
  availability_zone = var.subnet-1-availability_zone
  tags = {
    Name = var.subnet-1-name
  }
}

resource "aws_subnet" "subnet-2" {
  vpc_id            = aws_vpc.Example.id
  cidr_block        = var.subnet-2-cidr_block
  availability_zone = var.subnet-2-availability_zone
  tags = {
    Name = var.subnet-2-name
  }

}

resource "aws_subnet" "subnet-3" {
  vpc_id            = aws_vpc.Example.id
  cidr_block        = var.subnet-3-cidr_block
  availability_zone = var.subnet-3-availability_zone
  tags = {
    Name = var.subnet-3-name
  }

}

resource "aws_subnet" "subnet-4" {
  vpc_id            = aws_vpc.Example.id
  cidr_block        = var.subnet-4-cidr_block
  availability_zone = var.subnet-4-availability_zone
  tags = {
    Name = var.subnet-4-name
  }

}