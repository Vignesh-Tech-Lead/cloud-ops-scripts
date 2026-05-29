#!/bin/bash
# ==============================================================================
# Script Name : service_monitor.sh
# Description : Monitors critical services and attempts restart if down.
# Author      : Vignesh M
#
# Recommended Cron:
# Run every 5 minutes
# */5 * * * * /path/to/linux-scripts/service_monitor.sh
# ==============================================================================

# List of critical services to monitor
SERVICES=("nginx" "sshd" "mysql" "cron")
LOG_FILE="/var/log/service_monitor.log"

for SERVICE in "${SERVICES[@]}"; do
    if ! systemctl is-active --quiet "$SERVICE"; then
        echo "[$(date)] ALERT: $SERVICE is down! Attempting to restart." >> "$LOG_FILE"
        systemctl restart "$SERVICE"
        
        # Verify if restart was successful
        sleep 5
        if systemctl is-active --quiet "$SERVICE"; then
            echo "[$(date)] INFO: $SERVICE successfully restarted." >> "$LOG_FILE"
        else
            echo "[$(date)] CRITICAL: $SERVICE failed to restart. Manual intervention required." >> "$LOG_FILE"
            # Insert notification trigger here (e.g. curl to Slack webhook)
        fi
    fi
done
