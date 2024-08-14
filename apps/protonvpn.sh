#!/bin/bash

# Define the URL for the Proton VPN repository package
REPO_URL="https://repo.protonvpn.com/fedora-$(cat /etc/fedora-release | cut -d\  -f 3)-stable/protonvpn-stable-release/protonvpn-stable-release-1.0.1-2.noarch.rpm"
REPO_FILE="protonvpn-stable-release-1.0.1-2.noarch.rpm"

# Download the Proton VPN repository package
echo "Downloading Proton VPN repository package..."
wget "$REPO_URL" -O $REPO_FILE

# Install the Proton VPN repository
echo "Installing Proton VPN repository..."
sudo dnf install -y ./$REPO_FILE

# Install Proton VPN application
echo "Installing Proton VPN application..."
sudo dnf install --refresh proton-vpn-gnome-desktop -y

# Install GNOME desktop extensions for tray icons
echo "Installing GNOME extensions for tray icons..."
sudo dnf install -y libappindicator-gtk3 gnome-shell-extension-appindicator gnome-extensions-app

# Clean up the downloaded .rpm file
echo "Cleaning up..."
rm -f $REPO_FILE

# Display a notice message
echo "Proton VPN installed. Restart your computer to complete the installation."

# Check for updates and upgrade packages
echo "Checking for system updates and upgrading packages..."
sudo dnf check-update && sudo dnf upgrade -y

echo "Installation and update complete."

