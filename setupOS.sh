
echo *** SETUP DNF.CONF FILE ***
sudo sh -c "echo $'fastestmirror=True \nmax_parallel_downloads=10 \ndefaultyes=True \nkeepcache=True' >> /etc/dnf/dnf.conf"
sudo dnf clean all 

echo *** UPDATE OS ***
sudo dnf up -y

echo *** INSTALL SOME UTILITYS ***
sudo dnf install gnome-tweaks htop inxi powertop vlc neofetch vim gkrellm snapd -y

echo "**** ADD SUDOERS FILE ***"
sudo sh -c "echo ${USER} ALL=\(ALL\) NOPASSWD:ALL > /etc/sudoers.d/${USER}"

echo *** INSTALL RPM FUSION FEDORA ***
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

echo *** INSTALL MEDIA CODECS ***
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf groupupdate sound-and-video -y

echo *** INSTALL FLATPAK REPOSITORY ***
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo *** INSTALL FLATPAKS ***
flatpak install com.brave.Browser com.getpostman.Postman com.github.micahflee.torbrowser-launcher com.google.Chrome com.microsoft.Teams com.spotify.Client com.sublimetext.three com.visualstudio.code com.ylsoftware.qmmp.Qmmp io.github.mimbrero.WhatsAppDesktop org.eclipse.Java org.qbittorrent.qBittorrent us.zoom.Zoom

echo *** INSTALL SNAPD ***
snap install mysql-workbench-community -y


