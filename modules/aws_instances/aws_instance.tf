 terraform {
   required_version = ">= 1.0.0"
   required_providers {
     aws = {
       source  = "hashicorp/aws"
       version = "~> 4.25"
     }
   }
 }

resource "aws_instance" "infra_developer_instance"{
  ami               = var.ami
  instance_type     = var.instance_type
  count             = var.aws_instance_count
  availability_zone = var.availability_zone
  # Use the subnet ID and security group ID from the variables
  # to associate the instance with the correct network configuration
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.aws_security_group_id]

  tags = {
    Name = "Infra_Developer_Instance"
  }
  # Add any additional tags you need here
  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y apache2
              systemctl start apache2
              systemctl enable apache2

              echo "<h1>Welcome to Apache Server hosted via Terraform!</h1>" > /var/www/html/index.html
              EOF
  # Add any additional user data scripts you need here

}
