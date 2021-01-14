#!/bin/sh

ln -sf /usr/share/zoneinfo/America/Caracas /etc/localtime

hwclock --systohc

gawk -i inplace '{ gsub(/\#en_US.UTF-8 UTF-8/,"en_US.UTF-8 UTF-8") }; { print }' /etc/locale.gen

echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo "Which is your hostname?"

read $hostname

cat >> /etc/hosts << EOF
127.0.0.1    localhost
::1          localhost
127.0.1.1    $hostname.localdomain    $hostname
EOF
