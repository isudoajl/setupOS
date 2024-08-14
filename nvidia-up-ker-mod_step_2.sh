#!/bin/bash

echo "Running akmods with --force option..."
sudo akmods --force
if [ $? -ne 0 ]; then
  echo "Error: akmods failed with exit code $?"
  exit 1
fi

echo "Running dracut with --force option..."
sudo dracut --force
if [ $? -ne 0 ]; then
  echo "Error: dracut failed with exit code $?"
  exit 1
fi

echo "Script completed successfully."

