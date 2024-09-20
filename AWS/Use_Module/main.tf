### using VPC Module
module "VPC" {
  #source = "./modules/VPC"
  source = "github.com/Pratik-Ahire-git/Terraform_Zoon/AWS/modules/VPC"

  ## VPC
  vpc = {
    cidr_block       = "10.0.0.0/16"
    instance_tenancy = "default"
    Name             = "Multi_Region_VPC"
  }

  ## Public Subnet
  Public_subnet = [{
    cidr_block        = "10.0.0.0/24"
    availability_zone = "ap-south-2a"
    Name              = "Web1"
    }, {
    cidr_block        = "10.0.1.0/24"
    availability_zone = "ap-south-2b"
    Name              = "App1"
  }]

  ## Privat Subnet
  Private_subnet = [{
    cidr_block        = "10.0.2.0/24"
    availability_zone = "ap-south-2c"
    Name              = "Web2"
    }, {
    cidr_block        = "10.0.3.0/24"
    availability_zone = "ap-south-2a"
    Name              = "App2"
  }]

  ## Internet Gateway
  internet_gateways = {
    Name = "Multi_region_IG"
  }

  ## Public Route Table
  Public_Route_table = {
    Name       = "Multi_Region_RT"
    cidr_block = "0.0.0.0/0"
  }

}

### Using Security Group Module
module "Security_Group_vm" {
  #source = "./modules/Security_group"
  source = "github.com/Pratik-Ahire-git/Terraform_Zoon/AWS/modules/Security_group"

  Security_group_data = {
    name        = "Multi_region_SG"
    description = "Multi Region Security Group"
    vpc_id      = module.VPC.vpc_id
    Name        = "Multi_region_SG"
    inbound_rules = [{
      cidr_ipv4   = "0.0.0.0/0"
      from_port   = "22"
      to_port     = "22"
      ip_protocol = "tcp"
      description = "Allow ssh"
      }, {
      cidr_ipv4   = "0.0.0.0/0"
      from_port   = "80"
      to_port     = "80"
      ip_protocol = "tcp"
      description = "Allow http"
    }]
    outbound_rules   = []
    allow_all_egress = true
  }
  depends_on = [module.VPC]
}

module "Security_Group_db" {
  #source = "./modules/Security_group"
  source = "github.com/Pratik-Ahire-git/Terraform_Zoon/AWS/modules/Security_group"

  # Security group for vm Database
  Security_group_data = {
    name        = "db_security"
    description = "Use for database vm"
    vpc_id      = module.VPC.vpc_id
    Name        = "db_security"
    inbound_rules = [{
      cidr_ipv4   = "0.0.0.0/0"
      from_port   = "3306"
      to_port     = "3306"
      ip_protocol = "tcp"
      description = "Allow_db"
    }]
    outbound_rules   = []
    allow_all_egress = true
  }
  depends_on = [module.VPC]
}

## USe instace module
module "web_instance" {
  #source = "./modules/EC2_Instance"
  source = "github.com/Pratik-Ahire-git/Terraform_Zoon/AWS/modules/EC2_Instance"

  # Create ubuntu virtual Machine
  ec2 = {
    ami                         = "ami-068daf89d1895ab7b"
    Name                        = "web_VM"
    instance_type               = "t3.micro"
    user_data                   = true
    user_data_file              = "./install.sh"
    subnet_id                   = module.VPC.Public_subnet_id[0]
    associate_public_ip_address = true
    key_name                    = "Masterkey"
    vpc_security_group_ids      = module.Security_Group_vm.security_group_id
  }
}

module "bd_instance" {
  #source = "./modules/EC2_Instance"
  source = "github.com/Pratik-Ahire-git/Terraform_Zoon/AWS/modules/EC2_Instance"

  # Create database virtual Maching
  ec2 = {
    ami                         = "ami-068daf89d1895ab7b"
    Name                        = "db_VM"
    instance_type               = "t3.micro"
    user_data                   = false
    user_data_file              = "./install.sh"
    subnet_id                   = module.VPC.Private_subnet_id[0]
    associate_public_ip_address = false
    key_name                    = "Masterkey"
    vpc_security_group_ids      = module.Security_Group_db.security_group_id
  }
}
