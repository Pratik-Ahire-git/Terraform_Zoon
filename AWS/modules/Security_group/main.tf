### Resources to Create Security Group for the VPC
resource "aws_security_group" "Security_Group" {
  name        = var.Security_group_data.name
  description = var.Security_group_data.description
  vpc_id      = var.Security_group_data.vpc_id
  tags = {
    Name = var.Security_group_data.Name
  }

}

## Resource to create ingress(inbound) Rule for the VPC Security group 
resource "aws_vpc_security_group_ingress_rule" "Ingress_rule" {
  count             = length(var.Security_group_data.inbound_rules)
  security_group_id = aws_security_group.Security_Group.id
  cidr_ipv4         = var.Security_group_data.inbound_rules[count.index].cidr_ipv4
  from_port         = var.Security_group_data.inbound_rules[count.index].from_port
  to_port           = var.Security_group_data.inbound_rules[count.index].to_port
  ip_protocol       = var.Security_group_data.inbound_rules[count.index].ip_protocol
  description       = var.Security_group_data.inbound_rules[count.index].description

  depends_on = [ aws_security_group.Security_Group ]
}


### Resource to Create egress(Outbound) Rule for the VPC Security group
resource "aws_vpc_security_group_egress_rule" "SG_outbound_rule" {
  count             = length(var.Security_group_data.outbound_rules)
  security_group_id = aws_security_group.Security_Group.id
  cidr_ipv4         = var.Security_group_data.outbound_rules[count.index].cidr_ipv4
  from_port         = var.Security_group_data.outbound_rules[count.index].from_port
  to_port           = var.Security_group_data.outbound_rules[count.index].to_port
  ip_protocol       = var.Security_group_data.outbound_rules[count.index].ip_protocol
  description       = var.Security_group_data.outbound_rules[count.index].description
  
  depends_on = [ aws_security_group.Security_Group ]
}

### Resource to Create egress(Outbound) Allow_all_Egress Rule for the VPC Security group

resource "aws_vpc_security_group_egress_rule" "allow_all_egress" {
  count = var.Security_group_data.allow_all_egress ? 1 : 0
  security_group_id = aws_security_group.Security_Group.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
  depends_on = [ aws_security_group.Security_Group ]

  
}