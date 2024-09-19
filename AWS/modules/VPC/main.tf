## Resource to create AWS VPC
resource "aws_vpc" "Exampal_vpc" {
  cidr_block       = var.vpc.cidr_block
  instance_tenancy = var.vpc.instance_tenancy
  tags = {
    Name = var.vpc.Name
  }
}

## Resource to create public Subnets for the VPC
resource "aws_subnet" "Public_subnet" {
  count             = length(var.Public_subnet)
  vpc_id            = aws_vpc.Exampal_vpc.id
  cidr_block        = var.Public_subnet[count.index].cidr_block
  availability_zone = var.Public_subnet[count.index].availability_zone
  tags = {
    Name = var.Public_subnet[count.index].Name
  }

}

### Resource to create Private Subnets for the VPC
resource "aws_subnet" "Private_subnet" {
  count             = length(var.Private_subnet)
  vpc_id            = aws_vpc.Exampal_vpc.id
  cidr_block        = var.Private_subnet[count.index].cidr_block
  availability_zone = var.Private_subnet[count.index].availability_zone
  tags = {
    Name = var.Private_subnet[count.index].Name
  }

}
### Resources to create Internet gateway for the VPC
resource "aws_internet_gateway" "Internet_gateway" {
  vpc_id = aws_vpc.Exampal_vpc.id
  tags = {
    Name = var.internet_gateways.Name
  }
}

### Resources to create Route table 
resource "aws_route_table" "Public_Route_table" {
  count  = length(aws_subnet.Public_subnet)
  vpc_id = aws_vpc.Exampal_vpc.id

  route {
    cidr_block = var.Public_Route_table.cidr_block
    gateway_id = aws_internet_gateway.Internet_gateway.id
  }
  tags = {
    Name = var.internet_gateways.Name
  }
  depends_on = [
    aws_vpc.Exampal_vpc,
    aws_vpc.Exampal_vpc
  ]
}

### Resources to Associate the Subnet to the public Routable
resource "aws_route_table_association" "route_association" {
  count          = length(aws_subnet.Public_subnet)
  subnet_id      = aws_subnet.Public_subnet[count.index].id
  route_table_id = aws_route_table.Public_Route_table[count.index].id

  depends_on = [
    aws_subnet.Public_subnet,
    aws_route_table.Public_Route_table
  ]
}