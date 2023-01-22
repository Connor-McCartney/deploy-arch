rustup default stable

# dotfiles
cd /tmp
wget https://raw.githubusercontent.com/Connor-McCartney/dotfiles/main/install.sh
chmod +x install.sh
./install.sh

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

rm /home/connor/user.sh
