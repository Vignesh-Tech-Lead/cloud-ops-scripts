#!/bin/bash
# ==============================================================================
# Use Case: Automated Backup - Kafka
# Description: Backups kafka data directory safely.
# 
# Explanation: This file is part of the Linux Scripts suite. It provides a standardized template for backup_kafka.sh to maintain infrastructure and application reliability.
# 
# How to Use:
# Make the script executable using 'chmod +x backup_kafka.sh' and run it via './backup_kafka.sh'. It can also be added to a crontab for scheduled execution.
# ==============================================================================
BACKUP_DIR="/backup/kafka"
TIMESTAMP=$(date +"%Y%m%d%H%M")
mkdir -p $BACKUP_DIR
tar -czf $BACKUP_DIR/kafka_$TIMESTAMP.tar.gz /var/lib/kafka
echo "kafka backup completed."
