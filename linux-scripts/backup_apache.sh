#!/bin/bash
# ==============================================================================
# Use Case: Automated Backup - Apache
# Description: Backups apache data directory safely.
# 
# Explanation: This file is part of the Linux Scripts suite. It provides a standardized template for backup_apache.sh to maintain infrastructure and application reliability.
# 
# How to Use:
# Make the script executable using 'chmod +x backup_apache.sh' and run it via './backup_apache.sh'. It can also be added to a crontab for scheduled execution.
# ==============================================================================
BACKUP_DIR="/backup/apache"
TIMESTAMP=$(date +"%Y%m%d%H%M")
mkdir -p $BACKUP_DIR
tar -czf $BACKUP_DIR/apache_$TIMESTAMP.tar.gz /var/lib/apache
echo "apache backup completed."
