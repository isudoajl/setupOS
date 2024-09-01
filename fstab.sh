#!/bin/bash

echo "*** CREATING /mnt/sda1 DIRECTORY ***"

if ! sudo mkdir /mnt/sda1; then
  echo "Error: Failed to create directories"
  exit 1
fi

echo "*************************************************************************************************"

echo "*** MOUNTING /mnt/sda1 ***"

sda1_uuid="e5806df2-8353-4cdb-8ad8-44e0b7524785"

if ! echo "UUID=$sda1_uuid /mnt/sda1 ext4 defaults 0 0" | sudo tee -a /etc/fstab > /dev/null; then
  echo "Error: Failed to add sda1 to /etc/fstab"
  exit 1
fi

if ! sudo mount /mnt/sda1; then
  echo "Error: Failed to mount sda1"
  exit 1
fi
  echo "Error: Failed to reload system daemons"
  exit 1
fi

echo "Successfully mounted sda1 device"
