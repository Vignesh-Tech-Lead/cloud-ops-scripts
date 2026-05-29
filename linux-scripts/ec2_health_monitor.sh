#!/bin/bash
# ==============================================================================
# Script Name : ec2_health_monitor.sh
# Description : Checks basic EC2 health metrics using AWS CLI and generates report.
# Author      : Vignesh M
#
# Recommended Cron:
# Run every 15 minutes
# */15 * * * * /path/to/linux-scripts/ec2_health_monitor.sh
# ==============================================================================

REGION="eu-west-1" # Or whichever region is applicable
OUTPUT_FILE="/tmp/ec2_health_report.txt"

echo "=== EC2 Instance Health Report: $(date) ===" > "$OUTPUT_FILE"

# Retrieve instances and their status
aws ec2 describe-instance-status --region "$REGION" \
    --query 'InstanceStatuses[*].[InstanceId,InstanceState.Name,InstanceStatus.Status,SystemStatus.Status]' \
    --output text >> "$OUTPUT_FILE"

# Check for impaired instances
IMPAIRED_COUNT=$(grep -c "impaired" "$OUTPUT_FILE")

if [ "$IMPAIRED_COUNT" -gt 0 ]; then
    echo "ALERT: Found $IMPAIRED_COUNT impaired instance(s)!"
    cat "$OUTPUT_FILE"
    # Provide alerting integration here (e.g. Slack/SNS/Email)
else
    echo "All instances are healthy."
fi
