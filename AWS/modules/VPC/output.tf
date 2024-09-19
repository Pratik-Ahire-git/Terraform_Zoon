# Output the VPC ID
output "vpc_id" {
    value = aws_vpc.Exampal_vpc.id
}

# OutPut The Public subnet ID
output "Public_subnet_id" {
    value = aws_subnet.Public_subnet.*.id
}

# OutPut The Private subnet ID
output "Private_subnet_id" {
    value =  aws_subnet.Private_subnet.*.id
}