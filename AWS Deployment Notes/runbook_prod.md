# Deployment Runbook: PROD Environment

**Use Case: Standard Operating Procedure for PROD Deployments**
**Description: Steps required to deploy changes to the prod environment safely.**

**Explanation:** This file is part of the AWS Deployment Notes suite. It provides a standardized template for runbook_prod.md to maintain infrastructure and application reliability.

**How to Use:**
Read through this document before executing any deployment to ensure all prerequisites and safety checks are met.

## 1. Pre-Deployment Checks
- Ensure all CI tests passed.
- Verify prod database backups are current.

## 2. Deployment Execution
- Run Terraform apply for `prod_ec2.tf`.
- Run Ansible playbook to update configurations.
- Update k8s images.

## 3. Post-Deployment
- Monitor Grafana dashboards.
- Smoke test the prod endpoints.
