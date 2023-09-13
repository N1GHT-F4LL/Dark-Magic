#!/bin/bash

systemctl stop openvpnas

pyovpn_url="https://github.com/user/repository/raw/main/pyovpn-2.0-py3.10.egg"

# Destination directory
destination_dir="/usr/local/openvpn_as/lib/python"

# Download the file and save it to the destination directory
echo "Downloading the file from $pyovpn_url..."
if curl -sfL "$pyovpn_url" -o "$destination_dir/pyovpn-2.0-py3.10.egg"; then
    echo "File downloaded and saved to $destination_dir."
else
    echo "Failed to download the file."
fi

echo "Started the OpenVPN Access Server init."
sudo /usr/local/openvpn_as/bin/ovpn-init

