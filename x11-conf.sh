#!/bin/bash

# Create a new file
sudo touch /etc/X11/xorg.conf.d/nvidia.conf

# Add the content to the file
sudo bash -c 'cat << EOF > /etc/X11/xorg.conf.d/nvidia.conf
Section "OutputClass"
        Identifier "nvidia"
        MatchDriver "nvidia-drm"
        Driver "nvidia"
        Option "AllowEmptyInitialConfiguration"
        Option "SLI" "Auto"
        Option "BaseMosaic" "on"
        Option "PrimaryGPU" "yes"
EndSection

Section "ServerLayout"
        Identifier "layout"
        Option "AllowNVIDIAGPUScreens"
        Option "PrimaryGPU" "yes"
EndSection
EOF'

