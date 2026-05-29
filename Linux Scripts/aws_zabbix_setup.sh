#!/bin/bash

# ==============================================================================
# Script Name: aws_zabbix_setup.sh
# Description: Automates the setup of a Zabbix agent on an AWS EC2 Linux instance.
# Use Case: AWS Monitoring & Linux Infrastructure Environment
# Explanation: This script installs the Zabbix agent, configures it to communicate 
#              with the Zabbix Server, and ensures the service starts on boot.
# How to Use: sudo ./aws_zabbix_setup.sh <ZABBIX_SERVER_IP> <HOSTNAME>
# ==============================================================================

set -e

# Ensure the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (sudo)"
  exit 1
fi

ZABBIX_SERVER_IP=$1
ZABBIX_HOSTNAME=$2

if [ -z "$ZABBIX_SERVER_IP" ] || [ -z "$ZABBIX_HOSTNAME" ]; then
  echo "Usage: $0 <ZABBIX_SERVER_IP> <HOSTNAME>"
  exit 1
fi

echo "Installing Zabbix repository..."
# Assuming Ubuntu/Debian based EC2 instance for this example
wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-4+ubuntu22.04_all.deb
dpkg -i zabbix-release_6.0-4+ubuntu22.04_all.deb
apt update

echo "Installing Zabbix Agent..."
apt install zabbix-agent -y

echo "Configuring Zabbix Agent..."
ZABBIX_CONF="/etc/zabbix/zabbix_agentd.conf"
cp $ZABBIX_CONF ${ZABBIX_CONF}.bak

# Update server IP and Hostname
sed -i "s/^Server=127.0.0.1/Server=$ZABBIX_SERVER_IP/" $ZABBIX_CONF
sed -i "s/^ServerActive=127.0.0.1/ServerActive=$ZABBIX_SERVER_IP/" $ZABBIX_CONF
sed -i "s/^Hostname=Zabbix server/Hostname=$ZABBIX_HOSTNAME/" $ZABBIX_CONF

echo "Restarting and enabling Zabbix Agent service..."
systemctl restart zabbix-agent
systemctl enable zabbix-agent

echo "Zabbix Agent setup completed successfully on AWS EC2 instance!"
