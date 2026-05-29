#!/bin/bash

# ==============================================================================
# Script Name: veeam_backup_dr.sh
# Description: Triggers a Veeam Backup job via REST API for disaster recovery testing.
# Use Case: Infrastructure Backup & Disaster Recovery Operations
# Explanation: This script authenticates with the Veeam Backup Enterprise Manager 
#              REST API, triggers a specific backup job, and monitors its status.
# How to Use: ./veeam_backup_dr.sh "Daily_VM_Backup"
# ==============================================================================

set -e

JOB_NAME=$1
VEEAM_SERVER="https://veeam.internal.local:9398/api"
VEEAM_USER="admin"
VEEAM_PASS="securepassword" # Use secret management in production

if [ -z "$JOB_NAME" ]; then
  echo "Usage: $0 <JOB_NAME>"
  exit 1
fi

echo "Authenticating to Veeam Enterprise Manager..."
# Extract session token
AUTH_HEADER=$(curl -s -k -X POST -u "${VEEAM_USER}:${VEEAM_PASS}" "${VEEAM_SERVER}/sessionMngr/?v=v1.5" -i | grep -i "X-RestSvcSessionId" | awk -F': ' '{print $2}' | tr -d '\r')

if [ -z "$AUTH_HEADER" ]; then
  echo "Authentication failed!"
  exit 1
fi

echo "Authentication successful. Session ID: ${AUTH_HEADER}"

echo "Locating Job ID for job: $JOB_NAME..."
# Note: For illustration purposes. Parsing XML/JSON usually requires jq or xmllint
JOB_INFO=$(curl -s -k -X GET "${VEEAM_SERVER}/jobs" -H "X-RestSvcSessionId: ${AUTH_HEADER}" -H "Accept: application/json")
JOB_ID=$(echo "$JOB_INFO" | grep -oP "(?<=JobUid\": \")[^\"]*" | head -n 1) # Simplistic regex for example

if [ -z "$JOB_ID" ]; then
  echo "Job not found."
  exit 1
fi

echo "Triggering backup job ${JOB_ID}..."
START_RESPONSE=$(curl -s -k -X POST "${VEEAM_SERVER}/jobs/${JOB_ID}?action=start" -H "X-RestSvcSessionId: ${AUTH_HEADER}")

echo "Backup job triggered. Monitor via Veeam Console or API for completion."
echo "Disaster recovery testing sequence initiated."
