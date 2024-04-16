#!/bin/bash

# Nội dung mẫu của resolved.conf
resolved_conf_content="
# This file is part of systemd.
#
# systemd is free software; you can redistribute it and/or modify it
# under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation; either version 2.1 of the License, or
# (at your option) any later version.
#
# Entries in this file show the compile time defaults.
# You can change settings by editing this file.
# Defaults can be restored by simply deleting this file.
#
# See resolved.conf(5) for details

[Resolve]
#DNS=
#FallbackDNS=
#Domains=
#LLMNR=no
#MulticastDNS=no
#DNSSEC=no
#DNSOverTLS=no
#Cache=no-negative
#DNSStubListener=yes
#ReadEtcHosts=yes
"

# Đường dẫn của tệp cấu hình resolved.conf
resolved_conf_path="/etc/systemd/resolved.conf"

# Kiểm tra xem tệp resolved.conf đã tồn tại chưa
if [ -e "$resolved_conf_path" ]; then
    echo "Tệp $resolved_conf_path đã tồn tại. Không thể ghi đè."
    exit 1
fi

# Ghi nội dung mẫu vào tệp resolved.conf
echo "$resolved_conf_content" | sudo tee "$resolved_conf_path" > /dev/null

# Kiểm tra xem việc ghi đã thành công chưa
if [ $? -eq 0 ]; then
    echo "Đã tạo tệp $resolved_conf_path thành công."
else
    echo "Có lỗi xảy ra khi tạo tệp $resolved_conf_path."
    exit 1
fi
