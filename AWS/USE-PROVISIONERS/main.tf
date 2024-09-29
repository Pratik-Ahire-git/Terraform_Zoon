## This is for null resources
variable "build_id" {       #terraform apply -var "build_id=2"
  type    = string
  default = "1"

}

## fatch default vpc,security_group,Key_paire
data "aws_vpc" "default_vpc" {
  default = true
}

data "aws_security_group" "web" {
  vpc_id = data.aws_vpc.default_vpc.id
  name   = "allow-all"
}

data "aws_key_pair" "existing_key" {
  key_name = "Masterkey"

}


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

## Create instance using the Default data
resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [data.aws_security_group.web.id]
  key_name               = data.aws_key_pair.existing_key.key_name

  tags = {
    Name = "Work_nod"
  }
  ## Copy file From local to Remote resource
  #   provisioner "file" {
  #     source      = "installation.sh"
  #     destination = "installation.sh"

  #     connection {
  #       type        = "ssh"
  #       user        = "ubuntu"
  #       private_key = file("~/.ssh/id_rsa")
  #       host        = self.public_ip
  #     }
  #   }
}

resource "null_resource" "test" {
  triggers = {
    build_id = var.build_id
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = aws_instance.web.public_ip
  }
  provisioner "remote-exec" {
    script = "./installation.sh"        # execute this script on remote resource

  }

}