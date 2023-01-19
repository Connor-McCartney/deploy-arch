systemctl enable NetworkManager

pacman -S xorg-server xorg-apps sddm plasma-desktop plasma-wayland-session 


useradd -m -G users,wheel,audio,video,plugdev,sddm -s /bin/bash connor
printf " \n" > passwd connor
