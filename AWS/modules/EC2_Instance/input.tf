## AWS ec2 instance varaible

variable "ec2" {
    type = object({
      ami = string
      Name = string
      instance_type = string
      user_data = bool
      user_data_file = string
      subnet_id = string
      associate_public_ip_address = bool
      key_name = string
      vpc_security_group_ids = string
    })
  
} 