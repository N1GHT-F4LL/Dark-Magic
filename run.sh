#!/bin/bash

# Function to display error messages
function handle_error {
    local error_message="$1"
    echo "Error: $error_message"
    exit 1
}

# Stop the OpenVPN Access Server
echo "Stopping the OpenVPN Access Server..."
if ! systemctl stop openvpnas; then
    handle_error "Failed to stop the OpenVPN Access Server."
fi

# URL of the file to download
pyovpn_url="https://raw.githubusercontent.com/N1GHT-F4LL/Dark-Magic/main/pyovpn-2.0-py3.10.egg"

# Destination directory
destination_dir="/usr/local/openvpn_as/lib/python"

# Download the file and save it to the destination directory
echo "Downloading the file from $pyovpn_url..."
if ! curl -sfL "$pyovpn_url" -o "$destination_dir/pyovpn-2.0-py3.10.egg"; then
    handle_error "Failed to download the file."
else
    echo "File downloaded and saved to $destination_dir."
fi

# Start the OpenVPN Access Server init
echo "Starting the OpenVPN Access Server init..."
if ! sudo /usr/local/openvpn_as/bin/ovpn-init; then
    handle_error "Failed to run the OpenVPN Access Server init."
fi

echo "OpenVPN Access Server initialization completed successfully."
