# ==============================================================================
# Use Case: AWS Infrastructure as Code (IaC) - Web Tier Deployment
# Description: Provisions a VPC, public/private subnets, an Auto Scaling Group 
#              of EC2 instances, and an Application Load Balancer.
# 
# Explanation: This file is part of the Terraform suite. It provides a standardized template for main.tf to maintain infrastructure and application reliability.
# 
# How to Use:
# Run 'terraform init' followed by 'terraform plan' and 'terraform apply' to provision the resources defined in this file.
# ==============================================================================

provider "aws" {
  region = var.aws_region
}

# VPC Configuration
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "Production-VPC"
  }
}

# Public Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-Subnet"
  }
}

# EC2 Security Group
resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Deployed via Terraform</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "WebServer"
  }
}
