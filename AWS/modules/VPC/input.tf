### Variables for the VPC
variable "vpc" {
  type = object({
    cidr_block = string
    instance_tenancy = string
    Name = string
  })
  description = "This variables for the vpc Resources"

}

### Public Subnet Variabls
variable "Public_subnet" {
  type = list(object({
    cidr_block        = string
    availability_zone = string
    Name              = string
  }))
  description = "This Variables use for public Subnet"
}

### Privat Subnet Variables
variable "Private_subnet" {
  type = list(object({
    cidr_block        = string
    availability_zone = string
    Name              = string
  }))
}

### Internet gateway Variable
variable "internet_gateways" {
  type = object({
    Name = string
  })
}

### Public Route Table Variable
variable "Public_Route_table" {
  type = object({
    cidr_block = string
    Name = string
  })
}
