#!/bin/bash
# ==============================================================================
# Use Case: Automated Directory Backup to AWS S3
# Description: Archives a specific directory, timestamps it, and syncs to an 
#              AWS S3 bucket for disaster recovery purposes.
# 
# Explanation: This file is part of the Linux Scripts suite. It provides a standardized template for automated_backup.sh to maintain infrastructure and application reliability.
# 
# How to Use:
# Make the script executable using 'chmod +x automated_backup.sh' and run it via './automated_backup.sh'. It can also be added to a crontab for scheduled execution.
# ==============================================================================

SOURCE_DIR="/var/www/html"
BACKUP_DIR="/backup"
S3_BUCKET="s3://my-company-backups/daily/"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
ARCHIVE_NAME="website_backup_$TIMESTAMP.tar.gz"

echo "Starting backup process..."

# Create archive
tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" "$SOURCE_DIR"

if [ $? -eq 0 ]; then
    echo "Archive created successfully. Uploading to S3..."
    # Sync to S3
    aws s3 cp "$BACKUP_DIR/$ARCHIVE_NAME" "$S3_BUCKET"
    
    if [ $? -eq 0 ]; then
        echo "Backup successfully uploaded to S3."
    else
        echo "Failed to upload to S3."
    fi
else
    echo "Archive creation failed."
fi
