#!/bin/sh

INSTALL_DIR=$HOME/tmp-dotfiles

git clone --separate-git-dir=$HOME/.dotfiles https://github.com/ganpa3/dotfiles.git $INSTALL_DIR
rsync --recursive --verbose --exclude '.git' $INSTALL_DIR/ $HOME/
rm --recursive --force $INSTALL_DIR
