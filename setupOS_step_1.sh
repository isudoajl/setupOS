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

echo "*** INSTALL RPM FUSION FEDORA ***"
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
if [ $? -ne 0 ]; then
  echo "ERROR: Failed to install RPM Fusion Fedora."
  exit 1
fi

echo "*************************************************************************************************"

echo "*** INSTALL MEDIA CODECS ***"
sudo dnf group install multimedia -y
if [ $? -ne 0 ]; then
  echo "ERROR: Failed to install multimedia codecs."
  exit 1
fi

echo "*************************************************************************************************"

echo "*** SETUP \$PS1 VARIABLE ***"

echo "*** SET HOSTNAME NAME ***"
hostnamectl set-hostname vm-workstation
if [ $? -ne 0 ]; then
  echo "ERROR: Failed to set hostname."
  exit 1
fi

echo "*************************************************************************************************"

echo "*** SET ROUTER IN /etc/hosts ***"

echo "192.168.1.1 router" | sudo tee -a /etc/hosts




echo "*** END ***"

