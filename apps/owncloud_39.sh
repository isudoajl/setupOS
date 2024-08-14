#!/bin/sh
grep 'Fedora 39' /etc/os-release || ( echo "This INSTALL.sh is for 'Fedora 39'. Press CTRL-C to abort, ENTER to continue"; read a )
dnf -y install 'dnf-command(config-manager)'
dnf config-manager --add-repo https://download.owncloud.com/desktop/ownCloud/stable/latest/linux/Fedora_39/owncloud.repo || exit 1
rpm --import https://download.owncloud.com/desktop/ownCloud/stable/latest/linux/Fedora_39/repodata/repomd.xml.key
dnf install -y owncloud-client
