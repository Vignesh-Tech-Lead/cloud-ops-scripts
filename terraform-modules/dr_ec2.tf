# ==============================================================================
# Use Case: Infrastructure - DR EC2 Instances
# Description: Provisions EC2 instances for the dr environment.
# 
# Explanation: This file is part of the Terraform suite. It provides a standardized template for dr_ec2.tf to maintain infrastructure and application reliability.
# 
# How to Use:
# Run 'terraform init' followed by 'terraform plan' and 'terraform apply' to provision the resources defined in this file.
# ==============================================================================
resource "aws_instance" "dr_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.medium"
  tags = {
    Name = "DrServer"
    Environment = "dr"
  }
}
