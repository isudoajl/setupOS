#!/bin/bash

# Define variables
INTERFACE="wlo1"
IP_ADDRESS="192.168.1.66/24"
GATEWAY="192.168.1.1"
METHOD="manual"

# Execute the nmcli command with the defined variables
nmcli con mod $INTERFACE ipv4.address $IP_ADDRESS ipv4.gateway $GATEWAY ipv4.method $METHOD

# Restart the network connection to apply the changes
nmcli con up $INTERFACE

