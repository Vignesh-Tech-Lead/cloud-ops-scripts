#!/bin/bash
# ==============================================================================
# Use Case: Service Management - Rabbitmq
# Description: Safely restarts the rabbitmq service and checks its status.
# 
# Explanation: This file is part of the Linux Scripts suite. It provides a standardized template for restart_rabbitmq.sh to maintain infrastructure and application reliability.
# 
# How to Use:
# Make the script executable using 'chmod +x restart_rabbitmq.sh' and run it via './restart_rabbitmq.sh'. It can also be added to a crontab for scheduled execution.
# ==============================================================================
systemctl restart rabbitmq
if systemctl is-active --quiet rabbitmq; then
    echo "rabbitmq restarted successfully."
else
    echo "Failed to restart rabbitmq!" >&2
    exit 1
fi
