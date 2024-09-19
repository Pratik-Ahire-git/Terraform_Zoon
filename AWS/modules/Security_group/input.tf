variable "Security_group_data" {
  type = object({
    name        = string
    description = string
    vpc_id      = string
    Name = string
    inbound_rules = list(object({
      cidr_ipv4   = string
      from_port   = string
      to_port     =  string
      ip_protocol = string
      description = string
    }))
    outbound_rules = list(object({
      cidr_ipv4        = string
      from_port = string
      to_port = string
      ip_protocol   = string
      description = string
    }))
    allow_all_egress = bool
  })
  description = "security group info"
}