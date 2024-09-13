### Variables for the VPC
variable "aws_vpc_data" {
  type = object({
    cidr = string
    Name = string
  })
  description = "This variables for the vpc Resources"

}

### Public Subnet Variabls
variable "Public_subnet" {
  type = list(object({
    cidr              = string
    availability_zone = string
    Name              = string
  }))
  description = "This Variables use for public Subnet"
}

### Privat Subnet Variables
variable "Private_subnet" {
  type = list(object({
    cidr              = string
    availability_zone = string
    Name              = string
  }))
  description = "This variables for the Private Subnet"
}

### Internet gateway Variable
variable "aws_internet_gateway" {
  type = object({
    Name = string
  })
}

### Public Route Table Variable
variable "Public_Route_table" {
  type = object({
    Name = string
  })
}


### Security Group Variables
variable "aws_vpc_security" {
  type = object({
    name        = string
    description = string
    tag_Name    = string
  })

}

### Ingress(inbound) Rule Varaible
variable "Inbound_rule_SG" {
  type = list(object({
    cidr_ipv4   = string
    from_port   = string
    to_port     = string
    ip_protocol = string
    description = string
  }))
  description = "This variable for the inbound rule"
}

### Egress(Outbound) Rule Variable 
variable "Outbound_rule_SG" {
  type = list(object({
    cidr_ipv4   = string
    ip_protocol = string
    description = string
  }))
}

### EC2 Instance variable

variable "EC2_Instance" {
  type = object({
    ami                         = string
    instance_type               = string
    Name                        = string
    associate_public_ip_address = bool
    key_name                    = string
  })

}