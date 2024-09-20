output "VPC_ID" {
  value = module.VPC.vpc_id
}

output "private_subnet" {
  value = module.VPC.Private_subnet_id
}

output "Public_subnet" {
  value = module.VPC.Public_subnet_id
}

output "public_ip" {
  value = module.web_instance.public_ip

}

output "url-preschool" {
  value = [for instance in module.web_instance : "http://${module.web_instance.public_ip}/preschool"]

}

output "url-clinic" {
  value = [for instance in module.web_instance : "http://${module.web_instance.public_ip}/clinic"]

}