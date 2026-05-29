#!/bin/bash
# ==============================================================================
# Use Case: Identity Management - Create deployer user
# Description: Adds a new system user with the deployer profile.
# 
# Explanation: This file is part of the Linux Scripts suite. It provides a standardized template for add_user_deployer.sh to maintain infrastructure and application reliability.
# 
# How to Use:
# Make the script executable using 'chmod +x add_user_deployer.sh' and run it via './add_user_deployer.sh'. It can also be added to a crontab for scheduled execution.
# ==============================================================================
USERNAME=$1
if [ -z "$USERNAME" ]; then
    echo "Usage: $0 <username>"
    exit 1
fi
useradd -m -s /bin/bash -G deployer $USERNAME
echo "User $USERNAME added to deployer group."
