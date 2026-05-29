#!/bin/bash
# ==============================================================================
# Use Case: Service Management - Mysql
# Description: Safely restarts the mysql service and checks its status.
# 
# Explanation: This file is part of the Linux Scripts suite. It provides a standardized template for restart_mysql.sh to maintain infrastructure and application reliability.
# 
# How to Use:
# Make the script executable using 'chmod +x restart_mysql.sh' and run it via './restart_mysql.sh'. It can also be added to a crontab for scheduled execution.
# ==============================================================================
systemctl restart mysql
if systemctl is-active --quiet mysql; then
    echo "mysql restarted successfully."
else
    echo "Failed to restart mysql!" >&2
    exit 1
fi
