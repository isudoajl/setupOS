echo "*** REMOVE DIRECTORYS ***"
rm -fr ~/Documents ~/Pictures ~/Music ~/Videos ~/Templates ~/Public ~/Desktop ~/Downloads

echo "*** CREATE SOFT-LINKS ***"
ln -s /mnt/sda1/${USER}/Documents /home/${USER}/Documents
ln -s /mnt/sda1/${USER}/Pictures /home/${USER}/Pictures
ln -s /mnt/sda1/${USER}/Music /home/${USER}/Music
ln -s /mnt/sda1/${USER}/Public /home/${USER}/Public
ln -s /mnt/sda1/${USER}/Desktop /home/${USER}/Desktop
ln -s /mnt/sda1/${USER}/Templates /home/${USER}/Templates
ln -s /mnt/sda1/${USER}/Downloads /home/${USER}/Downloads
ln -s /mnt/sda1/${USER}/Videos /home/${USER}/Videos
