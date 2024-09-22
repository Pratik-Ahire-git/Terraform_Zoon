
## Resource to create AWS VPC
resource "aws_vpc" "Ntier-Network" {
  cidr_block       = var.aws_vpc_data.cidr
  instance_tenancy = "default"
  tags = {
    Name = var.aws_vpc_data.Name
  }
}

## Resource to create public Subnets for the VPC
resource "aws_subnet" "Ntier-Network-Public-Subnets" {
  count             = length(var.Public_subnet)
  vpc_id            = aws_vpc.Ntier-Network.id
  cidr_block        = var.Public_subnet[count.index].cidr
  availability_zone = var.Public_subnet[count.index].availability_zone
  tags = {
    Name = var.Public_subnet[count.index].Name
  }

}

### Resource to create Private Subnets for the VPC
resource "aws_subnet" "Ntier-Network-Private-Subnet" {
  count             = length(var.Private_subnet)
  vpc_id            = aws_vpc.Ntier-Network.id
  cidr_block        = var.Private_subnet[count.index].cidr
  availability_zone = var.Private_subnet[count.index].availability_zone
  tags = {
    Name = var.Private_subnet[count.index].Name
  }

}
### Resources to create Internet gateway for the VPC
resource "aws_internet_gateway" "Ntier-Network-Internet-gateway" {
  vpc_id = aws_vpc.Ntier-Network.id
  tags = {
    Name = var.aws_internet_gateway.Name
  }
}

### Resources to create Route table 
resource "aws_route_table" "Public_Route_table" {
  count  = length(aws_subnet.Ntier-Network-Public-Subnets)
  vpc_id = aws_vpc.Ntier-Network.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Ntier-Network-Internet-gateway.id
  }
  tags = {
    Name = var.aws_internet_gateway.Name
  }
  depends_on = [
    aws_vpc.Ntier-Network,
    aws_vpc.Ntier-Network
  ]
}

### Resources to Associate the Subnet to the public Routable
resource "aws_route_table_association" "route_association" {
  count          = length(aws_subnet.Ntier-Network-Public-Subnets)
  subnet_id      = aws_subnet.Ntier-Network-Public-Subnets[count.index].id
  route_table_id = aws_route_table.Public_Route_table[count.index].id

  depends_on = [
    aws_subnet.Ntier-Network-Public-Subnets,
    aws_route_table.Public_Route_table
  ]
}

### Resources to Create Security Group for the VPC
resource "aws_security_group" "Ntier-SG" {
  name        = var.aws_vpc_security.name
  description = var.aws_vpc_security.description
  vpc_id      = aws_vpc.Ntier-Network.id
  tags = {
    Name = var.aws_vpc_security.tag_Name
  }
  depends_on = [
    aws_vpc.Ntier-Network
  ]
}

## Resource to create ingress(inbound) Rule for the VPC Security group 
resource "aws_vpc_security_group_ingress_rule" "SG_Inbound_rule" {
  count             = length(var.Inbound_rule_SG)
  security_group_id = aws_security_group.Ntier-SG.id
  cidr_ipv4         = var.Inbound_rule_SG[count.index].cidr_ipv4
  from_port         = var.Inbound_rule_SG[count.index].from_port
  to_port           = var.Inbound_rule_SG[count.index].to_port
  ip_protocol       = var.Inbound_rule_SG[count.index].ip_protocol
  description       = var.Inbound_rule_SG[count.index].description
}

### Resource to Create egress(Outbound) Rule for the VPC Security group
resource "aws_vpc_security_group_egress_rule" "SG_outbound_rule" {
  count             = length(var.Outbound_rule_SG)
  security_group_id = aws_security_group.Ntier-SG.id
  cidr_ipv4         = var.Outbound_rule_SG[count.index].cidr_ipv4
  ip_protocol       = var.Outbound_rule_SG[count.index].ip_protocol
  description       = var.Outbound_rule_SG[count.index].description
}

### Resource to create ec2 instance in the network
resource "aws_instance" "Ubuntu-VM" {
  ami                         = var.EC2_Instance.ami
  instance_type               = var.EC2_Instance.instance_type
  subnet_id                   = aws_subnet.Ntier-Network-Public-Subnets[0].id
  associate_public_ip_address = var.EC2_Instance.associate_public_ip_address
  key_name                    = var.EC2_Instance.key_name
  vpc_security_group_ids = [aws_security_group.Ntier-SG.id]
  tags = {
    Name = var.EC2_Instance.Name
  }
  depends_on = [
    aws_vpc.Ntier-Network,
    aws_subnet.Ntier-Network-Public-Subnets,
    aws_security_group.Ntier-SG
  ]
}