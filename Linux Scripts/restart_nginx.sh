#!/bin/bash
# ==============================================================================
# Use Case: Service Management - Nginx
# Description: Safely restarts the nginx service and checks its status.
# 
# Explanation: This file is part of the Linux Scripts suite. It provides a standardized template for restart_nginx.sh to maintain infrastructure and application reliability.
# 
# How to Use:
# Make the script executable using 'chmod +x restart_nginx.sh' and run it via './restart_nginx.sh'. It can also be added to a crontab for scheduled execution.
# ==============================================================================
systemctl restart nginx
if systemctl is-active --quiet nginx; then
    echo "nginx restarted successfully."
else
    echo "Failed to restart nginx!" >&2
    exit 1
fi
