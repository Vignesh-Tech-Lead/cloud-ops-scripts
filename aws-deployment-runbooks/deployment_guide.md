# AWS Deployment Notes

**Use Case: Production Deployment Playbook**
**Description: Step-by-step documentation for deploying the application to AWS.**

**Explanation:** This file is part of the AWS Deployment Notes suite. It provides a standardized template for deployment_guide.md to maintain infrastructure and application reliability.

**How to Use:**
Read through this document before executing any deployment to ensure all prerequisites and safety checks are met.

## Architecture Overview
- **Compute:** AWS Auto Scaling Group with EC2 (t2.micro)
- **Database:** Amazon RDS for PostgreSQL (Multi-AZ)
- **Networking:** Custom VPC with Public/Private Subnets
- **Storage:** Amazon S3 for backups and static assets

## Prerequisites
1. AWS CLI configured with administrator credentials.
2. Terraform installed locally (v1.5+).
3. Ansible installed locally for configuration management.

## Deployment Steps

### 1. Infrastructure Provisioning (Terraform)
Navigate to the `Terraform` directory and initialize the state:
```bash
cd Terraform
terraform init
terraform plan -out=tfplan
terraform apply "tfplan"
```

### 2. Configuration Management (Ansible)
Once instances are up, retrieve their IP addresses and update the Ansible inventory.
```bash
cd Ansable
ansible-playbook -i inventory.ini web_server_setup.yml
```

### 3. Application Deployment (Docker/k8s)
If deploying to EKS (Elastic Kubernetes Service), apply the manifests:
```bash
cd k8s
kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-service.yaml
```

## Monitoring
Metrics are collected via Prometheus. View the Grafana dashboard for real-time CPU, Memory, and Application metrics. Alerts are configured in PagerDuty.
