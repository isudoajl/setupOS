#!/bin/bash

echo "*** INSTALL SOME UTILITYS ***"
sudo dnf xclip install gnome-tweaks htop inxi powertop neofetch vim gkrellm snapd tlp cronie libappindicator-gtk3 gnome-shell-extension-appindicator rsyslog fdupes podman-compose setroubleshoot-server -y
if [ $? -ne 0 ]; then
  echo "ERROR: Failed to install utilities."
  exit 1
fi

