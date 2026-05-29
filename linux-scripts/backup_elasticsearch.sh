#!/bin/bash
# ==============================================================================
# Use Case: Automated Backup - Elasticsearch
# Description: Backups elasticsearch data directory safely.
# 
# Explanation: This file is part of the Linux Scripts suite. It provides a standardized template for backup_elasticsearch.sh to maintain infrastructure and application reliability.
# 
# How to Use:
# Make the script executable using 'chmod +x backup_elasticsearch.sh' and run it via './backup_elasticsearch.sh'. It can also be added to a crontab for scheduled execution.
# ==============================================================================
BACKUP_DIR="/backup/elasticsearch"
TIMESTAMP=$(date +"%Y%m%d%H%M")
mkdir -p $BACKUP_DIR
tar -czf $BACKUP_DIR/elasticsearch_$TIMESTAMP.tar.gz /var/lib/elasticsearch
echo "elasticsearch backup completed."
