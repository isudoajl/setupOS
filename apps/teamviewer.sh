#!/bin/bash

# URL of the .rpm file
RPM_URL="https://download.teamviewer.com/download/linux/teamviewer-host.x86_64.rpm"

# File name
RPM_FILE="teamviewer-host.x86_64.rpm"

# Download the .rpm file
echo "Downloading $RPM_FILE..."
wget $RPM_URL -O $RPM_FILE

# Update the OS
echo "Updating the OS."
sudo dnf up -y

# Install the .rpm file using dnf
echo "Installing $RPM_FILE..."
sudo dnf install -y $RPM_FILE

# Clean up
echo "Cleaning up..."
rm -f $RPM_FILE

echo "Installation complete."

