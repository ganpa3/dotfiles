#!/bin/sh

git clone --separate-git-dir=$HOME/.dotfiles https://github.com/ganpa3/dotfiles.git $HOME/tmp-dotfiles
rsync --recursive --verbose --exclude '.git' $HOME/tmp-dotfiles/ $HOME/
rm --recursive --force $HOME/tmp-dotfiles
