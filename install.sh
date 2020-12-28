#!/bin/sh

INSTALL_DIR=$HOME/tmp-dotfiles

if [ "$1" == "ssh" ]; then
    echo "YES"
  #  git clone --separate-git-dir=$HOME/.dotfiles git@github.com:ganpa3/dotfiles.git $INSTALL_DIR
else
    echo "NO"
#    git clone --separate-git-dir=$HOME/.dotfiles https://github.com/ganpa3/dotfiles.git $INSTALL_DIR
fi

#rsync --recursive --verbose --exclude '.git' $INSTALL_DIR/ $HOME/
#rm --recursive --force $INSTALL_DIR
