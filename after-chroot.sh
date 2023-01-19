systemctl enable NetworkManager


useradd -m -G users,wheel,audio,video,plugdev,sddm -s /bin/bash connor
printf " \n" > passwd connor
