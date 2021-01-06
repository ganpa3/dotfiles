#!/usr/bin/env bash

INSTALL_DIR=$HOME/tmp-dotfiles

## Remove existing .dotfiles repo.
if [[ -d "$HOME/.dotfiles" ]]; then
    rm --recursive --force "$HOME/.dotfiles"
fi

if [[ "$1" == "minimal" ]]; then
	if [[ "$2" == "ssh" ]]; then
	    git clone -b minimal --single-branch --separate-git-dir=$HOME/.dotfiles git@github.com:ganpa3/dotfiles.git $INSTALL_DIR
	else
	    git clone -b minimal --single-branch --separate-git-dir=$HOME/.dotfiles https://github.com/ganpa3/dotfiles.git $INSTALL_DIR
	fi
else
	if [[ "$1" == "ssh" ]]; then
	    git clone --separate-git-dir=$HOME/.dotfiles git@github.com:ganpa3/dotfiles.git $INSTALL_DIR
	else
	    git clone --separate-git-dir=$HOME/.dotfiles https://github.com/ganpa3/dotfiles.git $INSTALL_DIR
	fi
fi

rsync --recursive --verbose --exclude '.git' $INSTALL_DIR/ $HOME/

git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config status.showUntrackedFiles no
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config core.excludesfile ~/.dotfilesignore

rm --recursive --force $INSTALL_DIR
