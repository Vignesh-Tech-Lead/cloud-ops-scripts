#!/bin/bash
# ==============================================================================
# Use Case: Automated Backup - Postgres
# Description: Backups postgres data directory safely.
# 
# Explanation: This file is part of the Linux Scripts suite. It provides a standardized template for backup_postgres.sh to maintain infrastructure and application reliability.
# 
# How to Use:
# Make the script executable using 'chmod +x backup_postgres.sh' and run it via './backup_postgres.sh'. It can also be added to a crontab for scheduled execution.
# ==============================================================================
BACKUP_DIR="/backup/postgres"
TIMESTAMP=$(date +"%Y%m%d%H%M")
mkdir -p $BACKUP_DIR
tar -czf $BACKUP_DIR/postgres_$TIMESTAMP.tar.gz /var/lib/postgres
echo "postgres backup completed."
