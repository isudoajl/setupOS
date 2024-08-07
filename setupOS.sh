#!/bin/bash

echo "**** ADD SUDOERS FILE ***"
sudo sh -c "echo ${USER} ALL=\(ALL\) NOPASSWD:ALL > /etc/sudoers.d/${USER}"
if [ $? -ne 0 ]; then
  echo "ERROR: Failed to add sudoers file."
  exit 1
fi

echo "*************************************************************************************************"

echo "*** SETUP DNF.CONF FILE ***"
sudo sh -c "echo $'fastestmirror=True \nmax_parallel_downloads=10 \ndefaultyes=True \nkeepcache=True' >> /etc/dnf/dnf.conf"
if [ $? -ne 0 ]; then
  echo "ERROR: Failed to setup dnf.conf file."
  exit 1
fi
sudo dnf clean all 
if [ $? -ne 0 ]; then
  echo "ERROR: Failed to clean dnf cache."
  exit 1
fi

echo "*************************************************************************************************" 

echo "*** UPDATE OS ***"
sudo dnf up -y
if [ $? -ne 0 ]; then
  echo "ERROR: Failed to update OS."
  exit 1
fi

echo "*************************************************************************************************" 

echo "*** INSTALL SOME UTILITYS ***"
sudo dnf install simplescreenrecorder gnome-tweaks htop inxi powertop neofetch vim gkrellm snapd tlp cronie libappindicator-gtk3 gnome-shell-extension-appindicator rsyslog fdupes podman-compose setroubleshoot-server -y
if [ $? -ne 0 ]; then
  echo "ERROR: Failed to install utilities."
  exit 1
fi

echo "*************************************************************************************************"

echo "*** INSTALL RPM FUSION FEDORA ***"
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
if [ $? -ne 0 ]; then
  echo "ERROR: Failed to install RPM Fusion Fedora."
  exit 1
fi

echo "*************************************************************************************************"

echo "*** INSTALL MEDIA CODECS ***"
sudo dnf group install Multimedia -y
if [ $? -ne 0 ]; then
  echo "ERROR: Failed to install multimedia codecs."
  exit 1
fi

echo "*************************************************************************************************"

echo "*** SETUP \$PS1 VARIABLE ***"

echo "*** SET HOSTNAME NAME ***"
hostnamectl set-hostname f37-server
if [ $? -ne 0 ]; then
  echo "ERROR: Failed to set hostname."
  exit 1
fi

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
)

for app in "${FLATPAK_APPS[@]}"; do
  flatpak install flathub "$app" -y
  if [ $? -ne 0 ]; then
    echo "Error installing $app. Exiting."
    exit 1
  fi
done

echo "All flatpaks installed successfully."

