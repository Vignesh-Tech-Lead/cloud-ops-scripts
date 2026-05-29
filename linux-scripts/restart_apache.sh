#!/bin/bash
# ==============================================================================
# Use Case: Service Management - Apache
# Description: Safely restarts the apache service and checks its status.
# 
# Explanation: This file is part of the Linux Scripts suite. It provides a standardized template for restart_apache.sh to maintain infrastructure and application reliability.
# 
# How to Use:
# Make the script executable using 'chmod +x restart_apache.sh' and run it via './restart_apache.sh'. It can also be added to a crontab for scheduled execution.
# ==============================================================================
systemctl restart apache
if systemctl is-active --quiet apache; then
    echo "apache restarted successfully."
else
    echo "Failed to restart apache!" >&2
    exit 1
fi
