#!/usr/bin/env bash
# Minimal post-install script executed after Kickstart install
set -euo pipefail


# Example: create a user, enable ssh, and finish
USERNAME=victor
if ! id -u "$USERNAME" &>/dev/null; then
useradd -m -s /bin/bash "$USERNAME"
echo "$USERNAME:changeme" | chpasswd
mkdir -p /home/$USERNAME/.ssh
chmod 700 /home/$USERNAME/.ssh
### add your public ssh  key here (or have Foreman insert it)
echo "ssh-rsa AAAA... your_key_here" > /home/$USERNAME/.ssh/authorized_keys
chmod 600 /home/$USERNAME/.ssh/authorized_keys
chown -R $USERNAME:$USERNAME /home/$USERNAME/.ssh
fi


#Pleasee  ensure cloud-init is disabled for future boots if desired
#touch /etc/cloud/cloud-init.disabled || true


exit 0
