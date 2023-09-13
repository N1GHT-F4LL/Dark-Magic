#!/bin/bash

# Đường dẫn đến thư mục chứa tệp pyovpn trong /usr/local/openvpn_as/lib/python
ovpnas_dir="/usr/local/openvpn_as/lib/python"

# Tìm đường dẫn đến tệp pyovpn-2.0-py trong ovpnas_dir
pyovpn_path=$(find "$ovpnas_dir" -type f -name "*pyovpn-2.0-py*")

# URL của tệp pyovpn trên GitHub
pyovpn_url="https://github.com/user/repository/raw/main/pyovpn-2.0-py3.10.egg"

# Kiểm tra xem tệp pyovpn đã tồn tại trong thư mục đích hay chưa
if [ -e "$pyovpn_path" ]; then
    echo "Tệp pyovpn đã tồn tại trong thư mục gốc."
    # Tải về tệp pyovpn từ GitHub
    echo "Đang tải về tệp pyovpn từ GitHub..."
    curl -LJO "$pyovpn_url" -o "$pyovpn_path"
    echo "Đã tải về và thay thế tệp pyovpn."
else
    echo "$pyovpn_path" not found
fi
