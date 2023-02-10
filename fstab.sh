#!/bin/bash

echo "*** CREATING sda1 sda2 and old-sda2 DIRECTORIES in /mnt ***"
if ! sudo mkdir /mnt/sda1 /mnt/sda2 /mnt/old-sda2; then
  echo "Error: Failed to create directories"
  exit 1
fi

echo "*************************************************************************************************"

echo "*** MOUNTING sda1 AND sda2 DEVICES ***"

sda1_uuid="dae51dd4-c895-4730-b153-156b394da23f"
sda2_uuid="eec760a8-a536-4f5d-9931-c39c6e4dab0c"
sda3_uuid="8592534b-b3ba-42f7-a344-51b11208ab88"

if ! echo "UUID=$sda1_uuid /mnt/sda1 ext4 defaults 0 0" | sudo tee -a /etc/fstab > /dev/null; then
  echo "Error: Failed to add sda1 to /etc/fstab"
  exit 1
fi

if ! echo "UUID=$sda2_uuid /mnt/sda2 ext4 defaults 0 0" | sudo tee -a /etc/fstab > /dev/null; then
  echo "Error: Failed to add sda2 to /etc/fstab"
  exit 1
fi

if ! echo "UUID=$sda2_uuid /mnt/old-sda2 ext4 defaults 0 0" | sudo tee -a /etc/fstab > /dev/null; then
  echo "Error: Failed to add old-sda2 to /etc/fstab"
  exit 1
fi


if ! sudo mount /mnt/sda1; then
  echo "Error: Failed to mount sda1"
  exit 1
fi

if ! sudo mount /mnt/sda2; then
  echo "Error: Failed to mount sda2"
  exit 1
fi

if ! sudo mount /mnt/old-sda2; then
  echo "Error: Failed to mount old-sda2"
  exit 1
fi


if ! sudo systemctl daemon-reload; then
  echo "Error: Failed to reload system daemons"
  exit 1
fi

echo "Successfully mounted sda1 and sda2 devices"

