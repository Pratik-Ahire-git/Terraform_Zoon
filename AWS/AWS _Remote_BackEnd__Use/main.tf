data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

## fetch key pair 
data "aws_key_pair" "system-key" {
  key_name = var.system-key
}

data "aws_vpc" "default_vpc" {
  id = var.vpc
}

data "aws_subnet" "subnet_id" {
  id = var.subnet_id

}

data "aws_security_group" "Allow_all" {
  #name = var.security_group
  id = var.security_group
}

data "aws_availability_zone" "az" {
  name = var.all_availability_zone

}



resource "aws_instance" "web" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  vpc_security_group_ids      = [data.aws_security_group.Allow_all.id]
  key_name                    = data.aws_key_pair.system-key.key_name
  associate_public_ip_address = true
  subnet_id                   = data.aws_subnet.subnet_id.id
  user_data                   = "./install.sh"

  availability_zone = data.aws_availability_zone.az.name

  tags = {
    Name = "HelloWorld"
  }



  depends_on = [
    data.aws_vpc.default_vpc,
    data.aws_subnet.subnet_id,
    data.aws_ami.ubuntu,
    data.aws_availability_zone.az,
  data.aws_security_group.Allow_all]
}