DISK="/dev/sda"


ln -sf /usr/share/zoneinfo/Australia/Brisbane /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "arch" > /etc/hostname

pacman -Syu --noconfirm rustup
rustup default stable
pacman -S --noconfirm base-devel xorg sddm grub konsole git npm wget spectacle discord sagemath
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

su connor

# Paru
cd /tmp
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

printf "1\ny\n \n" | paru google-chrome
printf "1\ny\n \n" | paru kwin-bismuth

# Packer
# https://github.com/wbthomason/packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

rm /after-chroot.sh
