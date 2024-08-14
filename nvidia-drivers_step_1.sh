#!/bin/bash

echo "*** INSTALLING PACKAGES ***"

PACKAGES="gcc kernel-headers kernel-devel akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-libs xorg-x11-drv-nvidia-libs.i686"

if sudo dnf install $PACKAGES -y; then
  echo "*** PACKAGES INSTALLED SUCCESSFULLY ***"
else
  echo "*** ERROR INSTALLING PACKAGES ***"
  exit 1
fi

echo "*** CHECKING INSTALLATION STATUS ***"
for package in $PACKAGES; do
  if ! sudo dnf list installed "$package" > /dev/null 2>&1; then
    echo "*** ERROR: $package NOT INSTALLED ***"
    exit 1
  fi
done

echo "*** ALL PACKAGES INSTALLED SUCCESSFULLY ***"
echo "*** WAIT 5-10 MIN FOR THE KERNEL MODULES TO LOAD UP ***"
