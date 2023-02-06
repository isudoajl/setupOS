#!/bin/bash
echo "*** REMOVE DIRECTORYS ***"
directories=(Documents Pictures Music Videos Templates Public Desktop Downloads)
for dir in "${directories[@]}"; do
  rm -fr ~/ "$dir"
done

echo "*** CREATE SOFT-LINKS ***"
for dir in "${directories[@]}"; do
  ln -s /mnt/sda1/${USER}/"$dir" /home/${USER}/"$dir" || { echo "Failed to create soft-link for $dir"; exit 1; }
done

