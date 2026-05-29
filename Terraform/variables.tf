# ==============================================================================
# Use Case: Terraform Variables
# Description: Defines the input variables for the Terraform configuration.
# 
# Explanation: This file is part of the Terraform suite. It provides a standardized template for variables.tf to maintain infrastructure and application reliability.
# 
# How to Use:
# Run 'terraform init' followed by 'terraform plan' and 'terraform apply' to provision the resources defined in this file.
# ==============================================================================

variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}
