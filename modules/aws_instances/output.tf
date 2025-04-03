# This file contains the output variables for the AWS instances module.
output "instance_type" {
  value = "t2.micro"
}
output "subnet_id" {
  value = "Subnet-A"
}
output "aws_vpc_id" {
  value = "default"
}
output "aws_security_group_id" {
  value = "default"
}
output "aws_instance_count" {
  value = 1
}
output "availability_zone" {
  value = "us-east-1a"
}
