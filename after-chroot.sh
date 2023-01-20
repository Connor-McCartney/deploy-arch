DISK="/dev/sda"


ln -sf /usr/share/zoneinfo/Australia/Brisbane /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "arch" > /etc/hostname

pacman -S --noconfirm xorg sddm grub konsole
pacman -S --noconfirm plasma-desktop plasma-wayland-session 

systemctl enable NetworkManager
systemctl enable sddm.service

grub-install $DISK # BIOS
# grub-install --target=x86_64-efi --efi-directory=/boot # UEFI
grub-mkconfig -o /boot/grub/grub.cfg

useradd -m -G users,wheel,audio,video,sddm -s /bin/bash connor
printf " \n \n" | passwd
printf " \n \n" | passwd connor
echo -e "root ALL=(ALL:ALL) ALL\n%wheel ALL=(ALL:ALL) ALL\n@includedir /etc/sudoers.d" > /etc/sudoers
