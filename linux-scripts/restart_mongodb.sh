#!/bin/bash
# ==============================================================================
# Use Case: Service Management - Mongodb
# Description: Safely restarts the mongodb service and checks its status.
# 
# Explanation: This file is part of the Linux Scripts suite. It provides a standardized template for restart_mongodb.sh to maintain infrastructure and application reliability.
# 
# How to Use:
# Make the script executable using 'chmod +x restart_mongodb.sh' and run it via './restart_mongodb.sh'. It can also be added to a crontab for scheduled execution.
# ==============================================================================
systemctl restart mongodb
if systemctl is-active --quiet mongodb; then
    echo "mongodb restarted successfully."
else
    echo "Failed to restart mongodb!" >&2
    exit 1
fi
