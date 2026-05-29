#!/bin/bash
# ==============================================================================
# Script Name : patch_update_automation.sh
# Description : Automates OS package updates and security patches.
# Author      : Vignesh M
#
# Recommended Cron:
# Run monthly on the 1st at 3:00 AM
# 0 3 1 * * /path/to/linux-scripts/patch_update_automation.sh
# ==============================================================================

LOG_FILE="/var/log/patch_update.log"
DRY_RUN=false

echo "=== Starting Patch Update at $(date) ===" >> "$LOG_FILE"

if [ "$1" == "--dry-run" ]; then
    DRY_RUN=true
    echo "Running in DRY RUN mode..." >> "$LOG_FILE"
fi

# Detect OS
if [ -f /etc/debian_version ]; then
    PKG_MANAGER="apt-get"
    UPDATE_CMD="$PKG_MANAGER update"
    UPGRADE_CMD="$PKG_MANAGER upgrade -y"
    DRY_UPGRADE_CMD="$PKG_MANAGER upgrade --dry-run"
elif [ -f /etc/redhat-release ]; then
    PKG_MANAGER="yum"
    UPDATE_CMD="$PKG_MANAGER check-update"
    UPGRADE_CMD="$PKG_MANAGER update -y"
    DRY_UPGRADE_CMD="yum update --assumeno"
else
    echo "Unsupported OS for automated patching." >> "$LOG_FILE"
    exit 1
fi

echo "Updating package lists..." >> "$LOG_FILE"
$UPDATE_CMD >> "$LOG_FILE" 2>&1

if [ "$DRY_RUN" = true ]; then
    echo "Dry run output:" >> "$LOG_FILE"
    $DRY_UPGRADE_CMD >> "$LOG_FILE" 2>&1
else
    echo "Applying updates..." >> "$LOG_FILE"
    $UPGRADE_CMD >> "$LOG_FILE" 2>&1
    
    # Check if a reboot is required (Debian/Ubuntu specific check)
    if [ -f /var/run/reboot-required ]; then
        echo "WARNING: System reboot is required after patching." >> "$LOG_FILE"
        # Option to automate reboot could be added here
        # /sbin/shutdown -r +5 "System rebooting for patch updates"
    fi
fi

echo "=== Patch Update Completed at $(date) ===" >> "$LOG_FILE"
