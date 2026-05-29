# Deployment Runbook: STAGING Environment

**Use Case: Standard Operating Procedure for STAGING Deployments**
**Description: Steps required to deploy changes to the staging environment safely.**

**Explanation:** This file is part of the AWS Deployment Notes suite. It provides a standardized template for runbook_staging.md to maintain infrastructure and application reliability.

**How to Use:**
Read through this document before executing any deployment to ensure all prerequisites and safety checks are met.

## 1. Pre-Deployment Checks
- Ensure all CI tests passed.
- Verify staging database backups are current.

## 2. Deployment Execution
- Run Terraform apply for `staging_ec2.tf`.
- Run Ansible playbook to update configurations.
- Update k8s images.

## 3. Post-Deployment
- Monitor Grafana dashboards.
- Smoke test the staging endpoints.
