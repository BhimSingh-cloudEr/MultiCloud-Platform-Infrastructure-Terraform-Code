variable "AWS_ACCESS_KEY" {
  description = "AWS access key"
}
variable "AWS_SECRET_KEY" {
  description = "AWS secret key"
}
variable "ami" {
  description = "value of ami"
  default     = "ami-084568db4383264d4"
}
variable "instance_type" {
  description = "value of instance_type"
  default     = "t2.micro"
}
variable "subnet_id" {
  description = "value of subnet_id"
  default     = "subnet-0fda9af90286071d0"
}
variable "aws_vpc_id" {
  description = "value of aws_vpc_id"
  default     = "vpc-0dca4e82649786bdf"
}
variable "aws_security_group_id" {
  description = "value of aws_security_group_id"
  default     = "sg-054538ef1277b3f83"
}
variable "aws_instance_count" {
  description = "Number of AWS instances to create"
  type        = number
  default     = 1
}
variable "availability_zone" {
  description = "Availability zone for the AWS instance"
  type        = string
  default     = "us-east-1a"
}
variable "instance_name" {
  description = "Name of the AWS instance"
  type        = string
}