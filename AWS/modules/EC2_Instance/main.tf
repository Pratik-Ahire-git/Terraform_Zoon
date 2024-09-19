## Resources to create ec2 instance

resource "aws_instance" "ec2" {
    ami = var.ec2.ami
    instance_type =  var.ec2.instance_type
    subnet_id = var.ec2.subnet_id
    associate_public_ip_address = var.ec2.associate_public_ip_address
    key_name = var.ec2.key_name
    vpc_security_group_ids = [var.ec2.vpc_security_group_ids]

    tags = {
      Name = var.ec2.Name
    }
    user_data = var.ec2.user_data ? file(var.ec2.user_data_file) : ""

}