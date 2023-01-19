systemctl enable NetworkManager


useradd -m -G users,wheel,audio,video -s /bin/bash connor
printf " \n" > passwd connor
