output "vpc_main_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "subnet_first_id" {
  description = "The ID of the first subnet"
  value       = aws_subnet.first_subnet.id
}