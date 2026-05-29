# Deployment Runbook: QA Environment

**Use Case: Standard Operating Procedure for QA Deployments**
**Description: Steps required to deploy changes to the qa environment safely.**

**Explanation:** This file is part of the AWS Deployment Notes suite. It provides a standardized template for runbook_qa.md to maintain infrastructure and application reliability.

**How to Use:**
Read through this document before executing any deployment to ensure all prerequisites and safety checks are met.

## 1. Pre-Deployment Checks
- Ensure all CI tests passed.
- Verify qa database backups are current.

## 2. Deployment Execution
- Run Terraform apply for `qa_ec2.tf`.
- Run Ansible playbook to update configurations.
- Update k8s images.

## 3. Post-Deployment
- Monitor Grafana dashboards.
- Smoke test the qa endpoints.
