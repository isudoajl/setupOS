#!/bin/bash

# Define the directories to be created
directories=(
    "Element"
    "MyPassport"
    "old-sda2"
    "sda1"
    "dsda2"
)

# Base path for directory creation
base_path="/mnt"

# Loop through each directory name
for dir in "${directories[@]}"; do
    # Create the directory with sudo
    sudo mkdir -p "$base_path/$dir"
    
    # Change the ownership to isudoajl:isudoajl
    sudo chown isudoajl:isudoajl "$base_path/$dir"
done

echo "Directories created and ownership set."

