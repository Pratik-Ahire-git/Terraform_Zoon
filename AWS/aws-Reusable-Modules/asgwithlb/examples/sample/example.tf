module "asgwithlb" {
  source = "../.."
  ami_info = {
    id       = "ami-0522ab6e1ddcc7055"
    username = "ubuntu"
  }
  template_details = {
    name                        = "nginx"
    instance_type               = "t2.micro"
    key_name                    = "my_idrsa"
    script_path                 = "installnginx.sh"
    security_group_ids          = ["sg-091f82f762a77f070"]
    associate_public_ip_address = true
  }
  scaling_details = {
    min_size   = 1
    max_size   = 2
    subnet_ids = ["subnet-067813a42fb6cbebe", "subnet-04b2161fd78085216"]
  }
  lb_details = {
    type               = "application"
    internal           = false
    security_group_ids = ["sg-091f82f762a77f070"]
    subnet_ids         = ["subnet-067813a42fb6cbebe", "subnet-04b2161fd78085216"]
    vpc_id             = "vpc-06e49f59e4246fd88"
    application_port   = 80
    port               = 80

  }


}