#!/bin/bash

echo "*** CREATING DIRECTORIES IF NOT EXIST ***"

# Ensure /mnt/sda1 directory exists
if [ ! -d "/mnt/sda1" ]; then
  sudo mkdir -p /mnt/sda1
fi

# Ensure /mnt/Sandisk_Linux directory exists
if [ ! -d "/mnt/Sandisk_Linux" ]; then
  sudo mkdir -p /mnt/Sandisk_Linux
fi

echo "*************************************************************************************************"

echo "*** UPDATING /etc/fstab ***"

sda1_uuid="e5806df2-8353-4cdb-8ad8-44e0b7524785"
sdl_uuid="0477a9bd-609d-495e-bcc8-495073d8981e"
fstab_file="/etc/fstab"

# Remove old entries if they exist
sudo sed -i "/\/mnt\/sda1/d" $fstab_file
sudo sed -i "/\/mnt\/Sandisk_Linux/d" $fstab_file

# Add the updated UUIDs to /etc/fstab
echo "UUID=$sda1_uuid /mnt/sda1 ext4 defaults 0 0" | sudo tee -a $fstab_file > /dev/null
echo "UUID=$sdl_uuid /mnt/Sandisk_Linux ext4 defaults 0 0" | sudo tee -a $fstab_file > /dev/null

echo "*** RELOADING MOUNT POINTS ***"

# Reload fstab without reboot
if ! sudo mount -a; then
  echo "Error: Failed to reload mount points"
  exit 1
fi

echo "Successfully updated and mounted sda1 and Sandisk_Linux!"
