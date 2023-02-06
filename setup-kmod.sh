#!/bin/bash
echo "*** GENERATE PUBLIC AND PRIVATE KEY ***"
sudo /usr/sbin/kmodgenca -a || { echo "Failed to generate public and private key."; exit 1; }

echo "*** ENROLL MOK ***"
sudo mokutil --import /etc/pki/akmods/certs/public_key.der || { echo "Failed to enroll MOK."; exit 1; }

