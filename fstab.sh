echo "*** CREATE sda1 sda2 DIRECTORYS in /mnt ***"
sudo mkdir /mnt/sda{1,2}

echo "*************************************************************************************************"

echo "*** MOUNT ADD SDA1 AND SDA2 DEVICES***"
sudo bash -c "echo UUID=dae51dd4-c895-4730-b153-156b394da23f /mnt/sda1 ext4 defaults 0 0 >> /etc/fstab"
sudo bash -c "echo UUID=8592534b-b3ba-42f7-a344-51b11208ab88 /mnt/sda2 ext4 defaults 0 0 >> /etc/fstab"
sudo mount /mnt/sda1
sudo mount /mnt/sda2
sudo systemctl daemon-reload

