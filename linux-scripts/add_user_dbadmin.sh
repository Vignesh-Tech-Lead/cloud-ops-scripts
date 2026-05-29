#!/bin/bash
# ==============================================================================
# Use Case: Identity Management - Create dbadmin user
# Description: Adds a new system user with the dbadmin profile.
# 
# Explanation: This file is part of the Linux Scripts suite. It provides a standardized template for add_user_dbadmin.sh to maintain infrastructure and application reliability.
# 
# How to Use:
# Make the script executable using 'chmod +x add_user_dbadmin.sh' and run it via './add_user_dbadmin.sh'. It can also be added to a crontab for scheduled execution.
# ==============================================================================
USERNAME=$1
if [ -z "$USERNAME" ]; then
    echo "Usage: $0 <username>"
    exit 1
fi
useradd -m -s /bin/bash -G dbadmin $USERNAME
echo "User $USERNAME added to dbadmin group."
