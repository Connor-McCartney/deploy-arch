
pacman -S xorg sddm konsole
pacman -S plasma-desktop plasma-wayland-session 

systemctl enable NetworkManager
systemctl enable sddm.service

useradd -m -G users,wheel,audio,video,plugdev,sddm -s /bin/bash connor
printf " \n" > passwd connor
printf "root ALL=(ALL:ALL) ALL\n%wheel ALL=(ALL:ALL) ALL\n@includedir /etc/sudoers.d" > /etc/sudoers



