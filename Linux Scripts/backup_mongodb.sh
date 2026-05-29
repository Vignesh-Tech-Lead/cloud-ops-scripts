#!/bin/bash
# ==============================================================================
# Use Case: Automated Backup - Mongodb
# Description: Backups mongodb data directory safely.
# 
# Explanation: This file is part of the Linux Scripts suite. It provides a standardized template for backup_mongodb.sh to maintain infrastructure and application reliability.
# 
# How to Use:
# Make the script executable using 'chmod +x backup_mongodb.sh' and run it via './backup_mongodb.sh'. It can also be added to a crontab for scheduled execution.
# ==============================================================================
BACKUP_DIR="/backup/mongodb"
TIMESTAMP=$(date +"%Y%m%d%H%M")
mkdir -p $BACKUP_DIR
tar -czf $BACKUP_DIR/mongodb_$TIMESTAMP.tar.gz /var/lib/mongodb
echo "mongodb backup completed."
