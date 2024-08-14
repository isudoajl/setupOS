#!/bin/bash

# Define the list of scripts to execute
SCRIPTS=(
    "./flatpak_apps.sh"
    "./OS_utilitys.sh"
    "./owncloud_39.sh"
    "./protonvpn.sh"
    "./teamviewer.sh"
)

# Iterate through each script and execute it
for script in "${SCRIPTS[@]}"; do
    if [[ -x "$script" ]]; then
        echo "Executing $script..."
        ./"$script"
        echo "$script executed successfully."
    else
        echo "Error: $script is not executable or not found."
    fi
done

echo "All scripts executed."

