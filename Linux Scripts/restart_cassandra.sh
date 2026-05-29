#!/bin/bash
# ==============================================================================
# Use Case: Service Management - Cassandra
# Description: Safely restarts the cassandra service and checks its status.
# 
# Explanation: This file is part of the Linux Scripts suite. It provides a standardized template for restart_cassandra.sh to maintain infrastructure and application reliability.
# 
# How to Use:
# Make the script executable using 'chmod +x restart_cassandra.sh' and run it via './restart_cassandra.sh'. It can also be added to a crontab for scheduled execution.
# ==============================================================================
systemctl restart cassandra
if systemctl is-active --quiet cassandra; then
    echo "cassandra restarted successfully."
else
    echo "Failed to restart cassandra!" >&2
    exit 1
fi
