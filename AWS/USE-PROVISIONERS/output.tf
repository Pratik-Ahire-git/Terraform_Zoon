output "browny_url" {
  value = "http://${aws_instance.web.public_ip}/browny"
}

output "repairs_url" {
  value = "http://${aws_instance.web.public_ip}/repairs"
}
