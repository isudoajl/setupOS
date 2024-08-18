#!/bin/sh
grep 'Fedora 39' /etc/os-release || ( echo "This INSTALL.sh is for 'Fedora 39'. Press CTRL-C to abort, ENTER to continue"; read a )
sudo dnf -y install 'dnf-command(config-manager)'
rpm --import https://download.owncloud.com/desktop/ownCloud/stable/latest/linux/Fedora_39/repodata/repomd.xml.key
sudo dnf config-manager --add-repo https://download.owncloud.com/desktop/ownCloud/stable/latest/linux/Fedora_39/owncloud-client.repo || exit 1
sudo dnf clean all
sudo dnf install owncloud-client -y
sudo dnf upgrade owncloud-client -y
