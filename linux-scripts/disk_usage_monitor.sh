#!/bin/bash
# ==============================================================================
# Script Name : disk_usage_monitor.sh
# Description : Monitors disk usage and sends an alert if usage exceeds threshold.
# Author      : Vignesh M
#
# Recommended Cron:
# Run every day at 8:00 AM
# 0 8 * * * /path/to/linux-scripts/disk_usage_monitor.sh
# ==============================================================================

THRESHOLD=85
EMAIL="admin@example.com"
LOG_FILE="/var/log/disk_monitor.log"

echo "Starting disk usage check at $(date)" >> "$LOG_FILE"

df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read -r output;
do
  usep=$(echo "$output" | awk '{ print $1}' | cut -d'%' -f1 )
  partition=$(echo "$output" | awk '{ print $2 }' )
  
  if [ "$usep" -ge "$THRESHOLD" ]; then
    MESSAGE="WARNING: Out of space \"$partition ($usep%)\" on $(hostname) as on $(date)"
    echo "$MESSAGE" >> "$LOG_FILE"
    
    # Send email (assuming mail/mailx is configured)
    # echo "$MESSAGE" | mail -s "Disk Space Alert: $partition" "$EMAIL"
    
    echo "Alert triggered for $partition ($usep%)"
  fi
done

echo "Disk check completed." >> "$LOG_FILE"
