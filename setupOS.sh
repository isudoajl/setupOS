echo "**** ADD SUDOERS FILE ***"
sudo sh -c "echo ${USER} ALL=\(ALL\) NOPASSWD:ALL > /etc/sudoers.d/${USER}"

echo "*************************************************************************************************"

echo "*** SETUP DNF.CONF FILE ***"
sudo sh -c "echo $'fastestmirror=True \nmax_parallel_downloads=10 \ndefaultyes=True \nkeepcache=True' >> /etc/dnf/dnf.conf"
sudo dnf clean all 

echo "*************************************************************************************************" 

echo "*** UPDATE OS ***"
sudo dnf up -y

echo "*************************************************************************************************" 

echo "*** INSTALL SOME UTILITYS ***"
sudo dnf install gnome-tweaks htop inxi powertop neofetch vim gkrellm snapd VirtualBox tlp -y

echo "*************************************************************************************************"

echo "*** INSTALL RPM FUSION FEDORA ***"
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

echo "*************************************************************************************************"

echo "*** INSTALL MEDIA CODECS ***"
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf groupupdate sound-and-video -y

echo "*************************************************************************************************"

echo "*** INSTALL FLATPAK REPOSITORY ***"
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "*************************************************************************************************"

echo "*** INSTALL FLATPAKS ***"
flatpak install flathub com.brave.Browser com.getpostman.Postman com.github.micahflee.torbrowser-launcher com.google.Chrome com.microsoft.Teams com.spotify.Client com.sublimetext.three com.visualstudio.code com.ylsoftware.qmmp.Qmmp io.github.mimbrero.WhatsAppDesktop org.eclipse.Java org.qbittorrent.qBittorrent us.zoom.Zoom org.freefilesync.FreeFileSync org.videolan.VLC com.github.PintaProject.Pinta -y

echo "*************************************************************************************************"

echo "*** CREATE sda1 sda2 DIRECTORYS in /mnt ***"
sudo mkdir /mnt/sda{1,2}
