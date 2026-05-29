# Cloud Ops Scripts

Welcome to my repository for Cloud Operations Scripts. This repository contains a collection of practical operational tooling, automation scripts, and configuration files developed to streamline Cloud Operations, System Administration, and Infrastructure Monitoring.

## Key Features

- **Linux Administration & Automation**: Automated server patching, user management, disk monitoring, and log rotation.
- **Cloud Operations**: AWS EC2 monitoring and S3 automation scripts.
- **Container Operations**: Docker health checks and deployment configurations.
- **Monitoring Tooling**: Integrations and setup scripts for comprehensive observability (Zabbix, Nagios).
- **Backup & Recovery**: Automated scheduling scripts for resilient disaster recovery (Veeam).

## Project Structure

```text
.
├── ansible-playbooks/       # Configuration management playbooks for automated provisioning
├── aws-deployment-runbooks/ # Standard Operating Procedures (SOPs) for AWS deployments
├── cicd-pipelines/          # Continuous Integration and Deployment pipeline configurations
├── docker-configs/          # Dockerfiles, health checks, and docker-compose definitions
├── k8s/                     # Kubernetes orchestration manifests
├── linux-scripts/           # Practical Bash scripts for routine operations and maintenance
├── monitoring-configs/      # Operational configurations for Zabbix, Nagios, etc.
└── terraform-modules/       # Infrastructure as Code modules for AWS environments
```

## Tech Stack
- **OS**: Linux (RHEL, Ubuntu), Windows Server
- **Cloud**: AWS (EC2, IAM, S3)
- **Containerization**: Docker, Kubernetes
- **Automation**: Bash, Ansible, Terraform
- **Monitoring**: Zabbix, Nagios

## Usage

Clone the repository to deploy these operational tools in your environment:

```bash
git clone https://github.com/Vignesh-Tech-Lead/cloud-ops-scripts.git
cd cloud-ops-scripts
chmod +x linux-scripts/*.sh
```

Many scripts are designed to be run via `cron` for automated scheduling. Refer to individual script comments for recommended cron expressions.

## Author
**Vignesh M**

- **Role**: Cloud Operations Engineer | DevOps Support | Senior System Administrator
- **Email**: mvignesh479@gmail.com
