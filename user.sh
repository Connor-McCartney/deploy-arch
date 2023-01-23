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

paru -S --noconfirm google-chrome kwin-bismuth-bin onlyoffice-bin dbus-glib-git

# Packer
# https://github.com/wbthomason/packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

rm /home/connor/user.sh
