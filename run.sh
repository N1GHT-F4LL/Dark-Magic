#!/bin/bash

access_server_path="/usr/local/openvpn_as/"

if [ -d "$access_server_path" ]; then
  echo "OpenVPN Access Server đã được cài đặt tại: $access_server_path"
else
  echo "OpenVPN Access Server không được cài đặt trên hệ thống này."
fi
