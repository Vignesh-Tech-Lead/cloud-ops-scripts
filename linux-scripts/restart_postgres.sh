#!/bin/bash
# ==============================================================================
# Use Case: Service Management - Postgres
# Description: Safely restarts the postgres service and checks its status.
# 
# Explanation: This file is part of the Linux Scripts suite. It provides a standardized template for restart_postgres.sh to maintain infrastructure and application reliability.
# 
# How to Use:
# Make the script executable using 'chmod +x restart_postgres.sh' and run it via './restart_postgres.sh'. It can also be added to a crontab for scheduled execution.
# ==============================================================================
systemctl restart postgres
if systemctl is-active --quiet postgres; then
    echo "postgres restarted successfully."
else
    echo "Failed to restart postgres!" >&2
    exit 1
fi
