#!/bin/bash

# Define a function to handle errors
error_handler() {
  echo "Error: $1" >&2
  exit 1
}

echo "*** INSTALL KVM UTILITIES ***"

# Define the list of utilities to be installed
utilities=(qemu dhclient virt-viewer libvirt dnsmasq dmidecode ebtables virt-install virt-manager bridge-utils)

# Install the utilities
for utility in "${utilities[@]}"; do
  if ! sudo dnf install -y "$utility"; then
    error_handler "Failed to install $utility"
  fi
done

echo "*** ENABLE libvirtd ***"

# Enable and start the libvirtd service
if ! sudo systemctl enable --now libvirtd; then
  error_handler "Failed to enable and start the libvirtd service"
fi

echo "*** SETUP PERMISSIONS ***"

# Create the configuration directory for libvirt
mkdir -p ~/.config/libvirt || error_handler "Failed to create the configuration directory for libvirt"

# Copy the libvirt configuration file
if ! sudo cp -rv /etc/libvirt/libvirt.conf ~/.config/libvirt/; then
  error_handler "Failed to copy the libvirt configuration file"
fi

# Change the owner of the libvirt configuration file to the current user
if ! sudo chown "$USER":wheel ~/.config/libvirt/libvirt.conf; then
  error_handler "Failed to change the owner of the libvirt configuration file"
fi

echo "*** ADDING RULES TO polkit ***"

# Define the rule to be added to polkit
RULE='polkit.addRule(function(action, subject) {
    if (action.id == "org.libvirt.unix.manage" &&
        subject.isInGroup("wheel")) {
            return polkit.Result.YES;
    }
});'

# Add the rule to polkit
if ! echo "$RULE" | sudo tee -a /etc/polkit-1/rules.d/50-libvirt.rules; then
  error_handler "Failed to add the rule to polkit"
fi

echo "*** SETUP COMPLETED SUCCESSFULLY ***"

