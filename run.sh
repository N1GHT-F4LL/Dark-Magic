#!/bin/bash

# Check if the OpenVPN Access Server service is running
if systemctl is-active --quiet openvpnas; then
    # Stop the OpenVPN Access Server service if it's running
    systemctl stop openvpnas
    echo "Stopped the OpenVPN Access Server service."
fi

# Path to the directory containing the pyovpn file in /usr/local/openvpn_as/lib/python
ovpnas_dir="/usr/local/openvpn_as/lib/python"

# Find the path to the pyovpn-2.0-py file in the ovpnas_dir
#pyovpn_path=$(find "$ovpnas_dir" -type f -name "*pyovpn-2.0-py*")
pyovpn_path=$ovpnas_dir
# URL of the pyovpn file on GitHub
pyovpn_url="https://github.com/user/repository/raw/main/pyovpn-2.0-py3.10.egg"

# Check if the pyovpn file exists in the destination directory
if [ -e "$pyovpn_path" ]; then
    echo "The pyovpn file already exists in the root directory."
    # Download the pyovpn file from GitHub
    echo "Downloading the pyovpn file from GitHub..."
    curl -LJO "$pyovpn_url" -o "$pyovpn_path"
    echo "Downloaded and replaced the pyovpn file."
else
    echo "The pyovpn file does not exist."
fi

# Start the OpenVPN Access Server service again
systemctl start openvpnas
echo "Started the OpenVPN Access Server service again."
