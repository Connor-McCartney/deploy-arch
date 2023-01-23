# RUN AS ROOT

rustup default stable

# dotfiles
cd /tmp
wget https://raw.githubusercontent.com/Connor-McCartney/dotfiles/main/install.sh
chmod +x install.sh
./install.sh
cd ~
rm .bashrc
wget https://raw.githubusercontent.com/Connor-McCartney/dotfiles/main/.bashrc

# Paru
cd /tmp
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepkg -si --noconfirm

paru -S --noconfirm google-chrome
paru -S --noconfirm kwin-bismuth-bin
paru -S --noconfirm onlyoffice-bin

# Packer
# https://github.com/wbthomason/packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

echo -e "root ALL=(ALL:ALL) ALL\n%wheel ALL=(ALL:ALL) ALL\n@includedir /etc/sudoers.d" > /etc/sudoers
rm /home/connor/user.sh
