
# NOTE : This is a poorly written script. Run at your own risk

# Things to do before running this script:
# Install and make zsh the default shell with chsh -s $(which zsh)
# If your pip is messes up, remove the current pip and install again with "sudo apt install python3-pip"

# Update the system
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt clean -y
rm -rf ~/.cache/thumbnails/*

# Some useful directories
mkdir -p ~/bin
mkdir -p ~/webdev
mkdir -p ~/source
mkdir -p ~/C++_Programs
mkdir -p ~/Python_Programs
mkdir -p ~/Kotlin_Programs

# Login without password
sudo sed -i '1i auth sufficient pam_succeed_if.so user ingroup adm' /etc/pam.d/gdm-password
# Reverse it
#sudo sed -i '1d' /etc/pam.d/gdm-password

# Enable click to minimise
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

# Show Battery Percentage
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Super + D to show desktop
gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Super>d']"

#####################################################################################################################
#                                       Installing language tools, compilers, etc.
#####################################################################################################################
# Basic development tools
sudo apt install git build-essential openjdk-15-jdk openjdk-15-jre pkg-config cmake clang make curl wget binutils fakeroot -y

# Install go
cd ~/Downloads
wget -c https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz -O - | sudo tar -xz -C /usr/local
export PATH=$PATH:/usr/local/go/bin
source ~/.zshrc
cd ~

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install kotlin
sudo snap install --classic kotlin

# Updates all the pip packages and install some
pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U
pip3 install black selenium scrapy virtualenvwrapper

# Installing nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash

# Installing latest node version
nvm install node

# Installing yarn
npm install -g yarn

# Installing prettier
cd ~/webdev
npm install -g --save-dev --save-exact prettier
echo {}> .prettierrc.json

# Install Github cli
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh

#####################################################################################################################

####################################################################################################################
#                                          Editors, Tools, Terminals, WMs, Apps, etc.
####################################################################################################################

# Essentials
sudo apt-get install vlc ubuntu-restricted-extras neovim tree neofetch ranger redshift mtools feh -y

# Install Oh-My-ZSH
touch ~/.zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -s https://raw.githubusercontent.com/ganpa3/dotfiles/main/.zshrc > ~/.zshrc
source ~/.zshrc

# Nwovim config
mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.vim
curl -s https://raw.githubusercontent.com/ganpa3/dotfiles/main/init.vim > ~/.config/nvim/init.vim

# Install regolith
sudo add-apt-repository ppa:regolith-linux/release
sudo apt install regolith-desktop-mobile

# Install alacritty
cd source
sudo apt install libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev # Dependencies
cargo build --release
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
sudo cp target/release/alacritty ~/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
mkdir -p ${ZDOTDIR:-~}/.zsh_functions
echo 'fpath+=${ZDOTDIR:-~}/.zsh_functions' >> ${ZDOTDIR:-~}/.zshrc
cp extra/completions/_alacritty ${ZDOTDIR:-~}/.zsh_functions/_alacritty

# Sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.listsudo
sudo apt-get update
sudo apt-get install sublime-text

# VS Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code # or code-insiders
####################################################################################################################
