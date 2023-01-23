DISK="/dev/sda"


ln -sf /usr/share/zoneinfo/Australia/Brisbane /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "arch" > /etc/hostname

pacman -Syu --noconfirm rustup
pacman -S --noconfirm networkmanager neovim man-db man-pages texinfo sudo base-devel xorg sddm grub vlc htop git npm wget keepassxc obsidian discord sagemath ttc-iosevka
# https://archlinux.org/groups/x86_64/plasma/
pacman -S --noconfirm plasma-desktop plasma-wayland-session plasma-nm plasma-pa dolphin konsole spectacle gwenview ark okular kwalletmanager

systemctl enable NetworkManager
systemctl enable sddm.service

printf "GRUB_TIMEOUT=1\nGRUB_DISTRIBUTOR=\"Arch\"\nGRUB_CMDLINE_LINUX=\"quiet loglevel=1 nowatchdog nvme_load=YES fsck.mode=skip modprobe.blacklist=iTCO_wdt\"\n" > /etc/default/grub
grub-install $DISK # BIOS
# grub-install --target=x86_64-efi --efi-directory=/boot # UEFI
grub-mkconfig -o /boot/grub/grub.cfg

useradd -m -G users,wheel,audio,video,sddm -s /bin/bash connor
printf " \n \n" | passwd
printf " \n \n" | passwd connor
echo -e "root ALL=(ALL:ALL) ALL\n%wheel ALL=(ALL:ALL) NOPASSWD: ALL\n@includedir /etc/sudoers.d" > /etc/sudoers

cd /home/connor
wget https://raw.githubusercontent.com/Connor-McCartney/deploy-arch/main/user.sh
chmod +x user.sh

rm /after-chroot.sh
