#!/bin/bash
# ==============================================================================
# Use Case: Automated Backup - Redis
# Description: Backups redis data directory safely.
# 
# Explanation: This file is part of the Linux Scripts suite. It provides a standardized template for backup_redis.sh to maintain infrastructure and application reliability.
# 
# How to Use:
# Make the script executable using 'chmod +x backup_redis.sh' and run it via './backup_redis.sh'. It can also be added to a crontab for scheduled execution.
# ==============================================================================
BACKUP_DIR="/backup/redis"
TIMESTAMP=$(date +"%Y%m%d%H%M")
mkdir -p $BACKUP_DIR
tar -czf $BACKUP_DIR/redis_$TIMESTAMP.tar.gz /var/lib/redis
echo "redis backup completed."
