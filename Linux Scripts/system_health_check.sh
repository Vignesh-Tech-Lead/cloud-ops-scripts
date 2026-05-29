#!/bin/bash
# ==============================================================================
# Use Case: System Health Monitoring & Alerting
# Description: This script checks the system's disk, memory, and CPU usage. 
#              It can be scheduled via cron to run periodically and alert 
#              administrators if thresholds are exceeded.
# 
# Explanation: This file is part of the Linux Scripts suite. It provides a standardized template for system_health_check.sh to maintain infrastructure and application reliability.
# 
# How to Use:
# Make the script executable using 'chmod +x system_health_check.sh' and run it via './system_health_check.sh'. It can also be added to a crontab for scheduled execution.
# ==============================================================================

THRESHOLD=80
EMAIL="admin@example.com"

# Check Disk Usage
DISK_USAGE=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
if [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
    echo "Warning: Disk usage is at ${DISK_USAGE}%" | mail -s "Disk Space Alert" $EMAIL
fi

# Check Memory Usage
MEMORY_USAGE=$(free -m | awk 'NR==2{printf "%.2f\n", $3*100/$2 }' | cut -d. -f1)
if [ "$MEMORY_USAGE" -gt "$THRESHOLD" ]; then
    echo "Warning: Memory usage is at ${MEMORY_USAGE}%" | mail -s "Memory Usage Alert" $EMAIL
fi

echo "System health check completed."
