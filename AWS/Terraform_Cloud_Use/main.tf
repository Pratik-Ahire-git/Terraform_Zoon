### using VPC Module
module "VPC" {
  source  = "app.terraform.io/learning_work/vpc/aws"    # Calling Source From Terraform Cloud Account
  version = "1.0.1"                                     # tag version of VCS
  #source = "./modules/VPC"
  #source = "github.com/Pratik-Ahire-git/Terraform_Zoon/AWS/modules/VPC"

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
