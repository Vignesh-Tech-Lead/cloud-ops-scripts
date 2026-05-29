#!/bin/bash
# ==============================================================================
# Use Case: Automated Backup - Nginx
# Description: Backups nginx data directory safely.
# 
# Explanation: This file is part of the Linux Scripts suite. It provides a standardized template for backup_nginx.sh to maintain infrastructure and application reliability.
# 
# How to Use:
# Make the script executable using 'chmod +x backup_nginx.sh' and run it via './backup_nginx.sh'. It can also be added to a crontab for scheduled execution.
# ==============================================================================
BACKUP_DIR="/backup/nginx"
TIMESTAMP=$(date +"%Y%m%d%H%M")
mkdir -p $BACKUP_DIR
tar -czf $BACKUP_DIR/nginx_$TIMESTAMP.tar.gz /var/lib/nginx
echo "nginx backup completed."
