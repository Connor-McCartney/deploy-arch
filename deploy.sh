DISK="/dev/sda"

# BIOS
printf "o\nn\n\n\n\n+8G\nn\n\n\n\n\nt\n1\n82\na\n2\nw\n" | fdisk $DISK  
mkswap /dev/$DISK1
mkfs.ext4 /dev/$DISK2
mount /dev/$DISK2 /mnt
swapon /dev/$DISK1
pacstrap -K /mnt base linux linux-firmware NetworkManager nvim man-db man-pages texinfo
genfstab -U /mnt >> /mnt/etc/fstab
