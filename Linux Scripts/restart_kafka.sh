#!/bin/bash
# ==============================================================================
# Use Case: Service Management - Kafka
# Description: Safely restarts the kafka service and checks its status.
# 
# Explanation: This file is part of the Linux Scripts suite. It provides a standardized template for restart_kafka.sh to maintain infrastructure and application reliability.
# 
# How to Use:
# Make the script executable using 'chmod +x restart_kafka.sh' and run it via './restart_kafka.sh'. It can also be added to a crontab for scheduled execution.
# ==============================================================================
systemctl restart kafka
if systemctl is-active --quiet kafka; then
    echo "kafka restarted successfully."
else
    echo "Failed to restart kafka!" >&2
    exit 1
fi
