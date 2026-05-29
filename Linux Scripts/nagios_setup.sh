#!/bin/bash

# ==============================================================================
# Script Name: nagios_setup.sh
# Description: Automates the setup of Nagios NRPE agent and prepares PRTG snmp.
# Use Case: Centralized Infrastructure Monitoring Setup
# Explanation: Installs the NRPE agent for Nagios server monitoring and configures 
#              SNMP for PRTG network monitoring to provide centralized visibility.
# How to Use: sudo ./nagios_setup.sh <NAGIOS_SERVER_IP>
# ==============================================================================

set -e

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (sudo)"
  exit 1
fi

NAGIOS_SERVER_IP=$1

if [ -z "$NAGIOS_SERVER_IP" ]; then
  echo "Usage: $0 <NAGIOS_SERVER_IP>"
  exit 1
fi

echo "Installing Nagios NRPE Agent..."
# Assuming Ubuntu/Debian for this script
apt-get update
apt-get install nagios-nrpe-server nagios-plugins -y

echo "Configuring NRPE..."
NRPE_CONF="/etc/nagios/nrpe.cfg"
cp $NRPE_CONF ${NRPE_CONF}.bak

# Allow the Nagios server IP
sed -i "s/^allowed_hosts=127.0.0.1,::1/allowed_hosts=127.0.0.1,::1,$NAGIOS_SERVER_IP/" $NRPE_CONF

echo "Restarting NRPE service..."
systemctl restart nagios-nrpe-server
systemctl enable nagios-nrpe-server
echo "Nagios NRPE setup completed."

echo "Installing SNMP daemon for PRTG Monitoring..."
apt-get install snmpd snmp libsnmp-dev -y

echo "Configuring SNMP for PRTG..."
SNMP_CONF="/etc/snmp/snmpd.conf"
mv $SNMP_CONF ${SNMP_CONF}.bak

cat <<EOF > $SNMP_CONF
# Minimal SNMPd configuration for PRTG
rocommunity public default
sysLocation "Primary Data Center"
sysContact "devops@internal.local"
EOF

echo "Restarting SNMP service..."
systemctl restart snmpd
systemctl enable snmpd

echo "SNMP setup for PRTG completed."
echo "Centralized monitoring agents installed successfully!"
