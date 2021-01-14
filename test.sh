#!/bin/sh

echo "Which partition to mount as root?"

read root

mkfs.ext4 $root

echo "Which partition for swap?"

read swap

mkswap $swap

mount /dev/$root /mnt
swapon /dev/$swap

pacstrap /mnt base base-devel linux linux-firmware dhcpcd os-prober ntfs-3g amd-ucode vim nano man-db man-pages texinfo grub

genfstab -U /mnt >> /mnt/etc/fstab
