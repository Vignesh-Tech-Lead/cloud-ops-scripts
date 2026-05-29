#!/bin/bash
# ==============================================================================
# Script Name : docker_health_check.sh
# Description : Checks running Docker containers, restarts unhealthy ones.
# Author      : Vignesh M
#
# Recommended Cron:
# Run every 5 minutes
# */5 * * * * /path/to/docker-configs/docker_health_check.sh
# ==============================================================================

LOG_FILE="/var/log/docker_health.log"

echo "[$(date)] Running Docker health check..." >> "$LOG_FILE"

# Check if Docker daemon is running
if ! systemctl is-active --quiet docker; then
    echo "CRITICAL: Docker service is not running. Attempting restart..." >> "$LOG_FILE"
    systemctl restart docker
fi

# Find containers with 'unhealthy' status
UNHEALTHY_CONTAINERS=$(docker ps -q -f health=unhealthy)

if [ -n "$UNHEALTHY_CONTAINERS" ]; then
    for CONTAINER in $UNHEALTHY_CONTAINERS; do
        NAME=$(docker inspect --format="{{.Name}}" "$CONTAINER" | sed 's/\///')
        echo "WARNING: Container $NAME ($CONTAINER) is unhealthy. Restarting..." >> "$LOG_FILE"
        docker restart "$CONTAINER"
    done
else
    echo "All containers are healthy." >> "$LOG_FILE"
fi
