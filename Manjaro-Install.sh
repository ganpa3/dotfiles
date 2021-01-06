#!/usr/bin/env bash

# NOTE : This is a poorly written script. Run at your own risk

# If having a separatee home directory, then make sure that groups among different distros have the same gid to avoid permission issues.
# It can be done by groupmod command.

# Things to do before running this script:
# If your pip is messed up, remove and install it again.

# Optimized mirror list
sudo pacman-mirrors --fasttrack

# Check for errors
sudo systemctl --failed

# Update and optimize pacman database
sudo pacman-db-upgrade && sync

# Update system
sudo pacman -Syu

# Some useful directories
mkdir -p ~/webdev
mkdir -p ~/source
mkdir -p ~/C++_Programs
mkdir -p ~/Python_Programs
mkdir -p ~/Kotlin_Programs

# Login without password
sudo sed -i '1i auth sufficient pam_succeed_if.so user ingroup wheel' /etc/pam.d/gdm-password
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

#####################################################################################################################
#                                       Installing language tools, compilers, etc.
#####################################################################################################################

# Basic development packages
sudo pacman -S --needed --noconfirm git base-devel neovim python-pynvim cmake clang binutils make curl gcc fakeroot jre-openjdk jdk-openjdk openjdk-doc openjdk-src kotlin go rust pkg-config

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
mkdir -p ~/webdev
cd ~/webdev
npm install -g --save-dev --save-exact prettier
echo {}> .prettierrc.json

# Github CLI
sudo pacman -S github-cli

#####################################################################################################################

####################################################################################################################
#                                       Editors, Tools, Terminals, WMs, Apps, etc.
####################################################################################################################

# Essentials
sudo pacman -S --noconfirm vlc alacritty tree feh ranger neofetch scrot rsync

## Setting up config files
# SSH
#git clone --separate-git-dir=$HOME/.dotfiles git@github.com:ganpa3/dotfiles.git ~/tmp

# HTTPS
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/ganpa3/dotfiles.git ~/tmp
rsync --recursive --verbose --exclude '.dotfiles' ~/tmp/ $HOME/
rm --recursive ~/tmp

# Install Oh-My-ZSH
touch ~/.zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -s https://raw.githubusercontent.com/ganpa3/dotfiles/main/.zshrc > ~/.zshrc
source ~/.zshrc

# Codecs and multimedia plugins
sudo pacman -S --noconfirm exfat-utils fuse-exfat a52dec faac faad2 flac jasper lame libdca libdv gst-libav libmad libmpeg2 libtheora libvorbis libxv wavpack x264 xvidcore gstreamer0.10-plugins flashplugin libdvdcss libdvdread libdvdnav gecko-mediaplayer dvd+rw-tools dvdauthor dvgrab

# First install chrome through add software app
# Install yay
cd /var/tmp/pamac-build-ganpa
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# System update
#yay -Syu

# Sublime
cd ~/Downloads
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
sudo pacman -Syu --noconfirm sublime-text
# BUG : If yay responds only with "database already registered", you probably have duplicate repositories in /etc/pacman.conf file.

# VS Code
yay --noconfirm --builddir ~/source -S visual-studio-code-bin
echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.d/40-max-user-watches.conf && sudo sysctl --system
####################################################################################################################
