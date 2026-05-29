#!/bin/bash
# ==============================================================================
# Use Case: Automated Backup - Rabbitmq
# Description: Backups rabbitmq data directory safely.
# 
# Explanation: This file is part of the Linux Scripts suite. It provides a standardized template for backup_rabbitmq.sh to maintain infrastructure and application reliability.
# 
# How to Use:
# Make the script executable using 'chmod +x backup_rabbitmq.sh' and run it via './backup_rabbitmq.sh'. It can also be added to a crontab for scheduled execution.
# ==============================================================================
BACKUP_DIR="/backup/rabbitmq"
TIMESTAMP=$(date +"%Y%m%d%H%M")
mkdir -p $BACKUP_DIR
tar -czf $BACKUP_DIR/rabbitmq_$TIMESTAMP.tar.gz /var/lib/rabbitmq
echo "rabbitmq backup completed."
