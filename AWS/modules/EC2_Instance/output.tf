output "ec2_instance" {
    value = aws_instance.ec2 
}

output "public_ip" {
    value = aws_instance.ec2.public_ip
  
}
