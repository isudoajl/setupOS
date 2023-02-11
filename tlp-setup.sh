#!/bin/bash

sudo systemctl mask power-profiles-daemon.service
sudo systemctl mask systemd-rfkill.service
sudo systemctl mask systemd-rfkill.socket
sudo systemctl enable --now tlp.service
sudo tlp start
