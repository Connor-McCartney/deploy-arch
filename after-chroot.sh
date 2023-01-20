
pacman -S xorg sddm konsole
pacman -S plasma-desktop plasma-wayland-session 

systemctl enable NetworkManager
systemctl enable sddm.service

useradd -m -G users,wheel,audio,video,sddm -s /bin/bash connor
printf " \n" > passwd connor
echo -e "root ALL=(ALL:ALL) ALL\n%wheel ALL=(ALL:ALL) ALL\n@includedir /etc/sudoers.d" > /etc/sudoers
