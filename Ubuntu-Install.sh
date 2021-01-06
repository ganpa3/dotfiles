#!/usr/bin/env bash

# NOTE : This is a poorly written script. Run at your own risk

# If having a separatee home directory, then make sure that groups among different distros have the same gid to avoid permission issues.
# It can be done by groupmod command.

# Things to do before running this script:
# If your pip is messed up, remove and install it again.

# Update the system
sudo apt update
sudo apt upgrade -y
sudo apt-get install -y curl wget git

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

#####################################################################################################################
#                                       GNOME specific settings
#####################################################################################################################
# Super + D to show desktop
gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Super>d']"
# This is used to set custom shortcuts in GNOME
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ name 'Chrome'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ command 'google-chrome'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ binding '<Super>b'

gsettings set org.gnome.desktop.wm.keybindings switch-applications "[]"
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Super>d']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Super>Tab', '<Alt>Tab']"
gsettings set org.gnome.nautilus.preferences always-use-location-entry true
gsettings set org.gnome.desktop.screensaver ubuntu-lock-on-suspend false
gsettings set org.gtk.Settings.FileChooser show-hidden true
#####################################################################################################################

# Adding packages to apt sources
# Regolith
 sudo add-apt-repository -y ppa:regolith-linux/release

# Subllime Text
 wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
 echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# VS Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# Github CLI
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository -y https://cli.github.com/packages

sudo apt-get update

packages=(
"git"
"build-essential"
"python3-dev"
"openjdk-15-jdk"
"openjdk-15-jre"
"pkg-config"
"cmake"
"clang"
"make"
"curl"
"wget"
"binutils"
"fakeroot"
"vlc"
"neovim"
"tree"
"neofetch"
"ranger"
"redshift"
"mtools"
"feh"
"tmux"
"gparted"
"papirus-icon-theme"
"apt-transport-https"
"qbittorrent"
"dconf-editor"
"dunst"
"libnotify-bin"
"ffmpeg"
"regolith-desktop-mobile" # OR regolith-desktop-standard for desktop
"alacritty"
"sublime-text"
"code"
"gh"
"ubuntu-restricted-extras" # Keep this at last, since it involves agreeing to a license.
)

sudo apt-get install -y "${packages[@]}"

# Google Chrome
wget -v --tries=3 https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O "$HOME"/Downloads/google-chrome-stable_current_amd64.deb
sudo dpkg -i "$HOME"/Downloads/google-chrome-stable_current_amd64.deb

# Install go
cd ~/Downloads || exit
wget -c https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz -O - | sudo tar -xz -C /usr/local
export PATH=$PATH:/usr/local/go/bin
source ~/.zshrc
cd ~ || exit

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install kotlin
sudo snap install --classic kotlin

# Updates all the pip packages and install some
pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U
pip3 install black selenium scrapy virtualenvwrapper

# Installing nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash

# Installing latest node version and npm packages
nvm install node
npm install -g serve http-server yarn prettier
