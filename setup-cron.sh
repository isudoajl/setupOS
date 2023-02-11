#!/bin/bash

# Create the file /etc/cron.daily/update
sudo touch /etc/cron.daily/update

# Add the shebang line and the command "sudo dnf -y update" to the file
echo -e "#!/bin/bash\nsudo dnf up -y" | sudo tee /etc/cron.daily/update
# Set the permissions of the file to 755
sudo chmod 755 /etc/cron.daily/update

# Confirm that the file was created and the permissions were set
if [ -f /etc/cron.daily/update ] && [ $(stat -c %a /etc/cron.daily/update) == "755" ]; then
  echo "The file /etc/cron.daily/update was created with the correct permissions."
else
  echo "There was an error creating the file or setting the permissions."
fi

