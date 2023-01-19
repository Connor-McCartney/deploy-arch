DISK="/dev/sda"

# BIOS
printf "o\nn\n\n\n\n+8G\nn\n\n\n\n\nt\n1\n82\na\n2\nw\n" | fdisk $DISK  
mkswap "$DISK""1"
mkfs.ext4 "$DISK""2"
mount "$DISK""2" /mnt
swapon "$DISK""1"
#pacstrap -K /mnt base linux linux-firmware networkmanager neovim man-db man-pages texinfo
#genfstab -U /mnt >> /mnt/etc/fstab
