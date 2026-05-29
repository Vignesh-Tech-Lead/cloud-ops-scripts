#!/bin/bash
# ==============================================================================
# Use Case: Service Management - Elasticsearch
# Description: Safely restarts the elasticsearch service and checks its status.
# 
# Explanation: This file is part of the Linux Scripts suite. It provides a standardized template for restart_elasticsearch.sh to maintain infrastructure and application reliability.
# 
# How to Use:
# Make the script executable using 'chmod +x restart_elasticsearch.sh' and run it via './restart_elasticsearch.sh'. It can also be added to a crontab for scheduled execution.
# ==============================================================================
systemctl restart elasticsearch
if systemctl is-active --quiet elasticsearch; then
    echo "elasticsearch restarted successfully."
else
    echo "Failed to restart elasticsearch!" >&2
    exit 1
fi
