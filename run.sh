#!/bin/bash

# Đường dẫn đến thư mục chứa tệp pyovpn trong /usr/local/openvpn_as/lib/python
pyovpn_dir="/usr/local/openvpn_as/lib/python"

# URL của tệp pyovpn trên GitHub
github_url="https://github.com/user/repository/raw/main/pyovpn-2.0-py3.10.egg"

# Thư mục đích để lưu tệp pyovpn
destination_dir="/path/to/destination"

# Kiểm tra xem tệp pyovpn đã tồn tại trong thư mục đích hay chưa
if [ -e "$pyovpn_dir/pyovpn-2.0-py3.10.egg" ]; then
    echo "Tệp pyovpn đã tồn tại trong thư mục gốc."
else
    # Tải về tệp pyovpn từ GitHub
    echo "Đang tải về tệp pyovpn từ GitHub..."
    curl -LJO "$github_url" -o "$destination_dir/pyovpn-2.0-py3.10.egg"
    
    # Di chuyển tệp tải về vào thư mục gốc (được giả định là /usr/local/openvpn_as/lib/python)
    mv "$destination_dir/pyovpn-2.0-py3.10.egg" "$pyovpn_dir/"
    
    echo "Đã tải về và thay thế tệp pyovpn."
fi
