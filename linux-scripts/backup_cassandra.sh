#!/bin/bash
# ==============================================================================
# Use Case: Automated Backup - Cassandra
# Description: Backups cassandra data directory safely.
# 
# Explanation: This file is part of the Linux Scripts suite. It provides a standardized template for backup_cassandra.sh to maintain infrastructure and application reliability.
# 
# How to Use:
# Make the script executable using 'chmod +x backup_cassandra.sh' and run it via './backup_cassandra.sh'. It can also be added to a crontab for scheduled execution.
# ==============================================================================
BACKUP_DIR="/backup/cassandra"
TIMESTAMP=$(date +"%Y%m%d%H%M")
mkdir -p $BACKUP_DIR
tar -czf $BACKUP_DIR/cassandra_$TIMESTAMP.tar.gz /var/lib/cassandra
echo "cassandra backup completed."
