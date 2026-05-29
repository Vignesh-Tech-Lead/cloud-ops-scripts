#!/bin/bash
# ==============================================================================
# Script Name : log_cleanup.sh
# Description : Archives old logs and deletes logs older than retention period.
# Author      : Vignesh M
#
# Recommended Cron:
# Run weekly on Sunday at 2:00 AM
# 0 2 * * 0 /path/to/linux-scripts/log_cleanup.sh
# ==============================================================================

LOG_DIR="/var/log/myapp"
ARCHIVE_DIR="/var/log/myapp/archive"
RETENTION_DAYS=30

# Create archive directory if it doesn't exist
mkdir -p "$ARCHIVE_DIR"

echo "Starting log cleanup at $(date)"

# Compress logs older than 7 days that are not already compressed
find "$LOG_DIR" -maxdepth 1 -type f -name "*.log" -mtime +7 -exec gzip {} \;

# Move compressed logs to archive directory
find "$LOG_DIR" -maxdepth 1 -type f -name "*.gz" -exec mv {} "$ARCHIVE_DIR" \;

# Delete logs older than retention period
find "$ARCHIVE_DIR" -type f -name "*.gz" -mtime +$RETENTION_DAYS -exec rm -f {} \;

echo "Log cleanup completed successfully."
