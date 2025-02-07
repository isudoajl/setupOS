#!/bin/bash

echo "*************************************************************************************************"
echo "*** INSTALL FLATPAKS ***"
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
if [ $? -ne 0 ]; then
  echo "ERROR: Failed to install Flatpak Repository"
  exit 1
fi

FLATPAK_APPS=(
  org.flameshot.Flameshot
  com.brave.Browser
  com.getpostman.Postman
  com.github.micahflee.torbrowser-launcher
  com.google.Chrome
  com.microsoft.Teams
  com.spotify.Client
  com.sublimetext.three
  com.visualstudio.code
  com.ylsoftware.qmmp.Qmmp
  io.github.mimbrero.WhatsAppDesktop
  org.eclipse.Java
  org.qbittorrent.qBittorrent
  us.zoom.Zoom
  org.freefilesync.FreeFileSync
  org.videolan.VLC
  com.github.PintaProject.Pinta
  org.flameshot.Flameshot
  com.obsproject.Studio
)

for app in "${FLATPAK_APPS[@]}"; do
  flatpak install flathub "$app" -y
  if [ $? -ne 0 ]; then
    echo "Error installing $app. Exiting."
    exit 1
  fi
done

