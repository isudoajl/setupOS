!#/bin/bash
echo "*** INSTALL KVM UTILITYS ***"

sudo dnf install \
  qemu \
  dhclient \
  virt-viewer \   
  libvirt \
  dnsmasq \
  dmidecode \
  ebtables \
  virt-install \
  virt-manager \
  bridge-utils

echo "*** PERMISSIONS ***"
# You need manually enable the last sentence in this file
mkdir ~/.config/libvirt && \
sudo cp -rv /etc/libvirt/libvirt.conf ~/.config/libvirt/ &&\
sudo chown ${USER}:wheel ~/.config/libvirt/libvirt.conf

echo "*** PERMISSIONS ***"

RULE='polkit.addRule(function(action, subject) {
    if (action.id == "org.libvirt.unix.manage" &&
        subject.isInGroup("wheel")) {
            return polkit.Result.YES;
    }
});'

echo "$RULE" | sudo tee -a /etc/polkit-1/rules.d/50-libvirt.rules

sudo systemctl enable --now libvirtd
