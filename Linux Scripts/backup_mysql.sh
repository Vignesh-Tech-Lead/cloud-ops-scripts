#!/bin/bash
# ==============================================================================
# Use Case: Automated Backup - Mysql
# Description: Backups mysql data directory safely.
# 
# Explanation: This file is part of the Linux Scripts suite. It provides a standardized template for backup_mysql.sh to maintain infrastructure and application reliability.
# 
# How to Use:
# Make the script executable using 'chmod +x backup_mysql.sh' and run it via './backup_mysql.sh'. It can also be added to a crontab for scheduled execution.
# ==============================================================================
BACKUP_DIR="/backup/mysql"
TIMESTAMP=$(date +"%Y%m%d%H%M")
mkdir -p $BACKUP_DIR
tar -czf $BACKUP_DIR/mysql_$TIMESTAMP.tar.gz /var/lib/mysql
echo "mysql backup completed."
