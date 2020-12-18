#!/bin/sh

git clone --separate-git-dir=$HOME/.dotfiles https://github.com/ganpa3/dotfiles.git $HOME/tmp
rsync --recursive --verbose --exclude '.git' ~/tmp/ $HOME/
rm --recursive --force ~/tmp
