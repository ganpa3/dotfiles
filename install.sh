#!/usr/bin/env bash

INSTALL_DIR=/tmp/tmp-dotfiles

OPTIONS=$(getopt --options ms --longoptions minimal,ssh --name "$0" -- "$@")
eval set -- "$OPTIONS"

MINMAL=false
SSH=false

while true; do
    case "$1" in
        -m | --minimal ) MINIMAL=true; shift ;;
        -s | --ssh ) SSH=true; shift ;;
        -- ) shift; break ;;
        * ) echo "DOBA! Sahi arguments de."; break ;;
    esac
done

## Remove existing .dotfiles repo.
if [[ -d "$HOME/.dotfiles" ]]; then
    rm --recursive --force "$HOME/.dotfiles"
fi

if [[ "$MINIMAL" == "true" ]]; then
	if [[ "$SSH" == "true" ]]; then
	    git clone -b minimal --single-branch --separate-git-dir=$HOME/.dotfiles git@github.com:ganpa3/dotfiles.git $INSTALL_DIR
	else
	    git clone -b minimal --single-branch --separate-git-dir=$HOME/.dotfiles https://github.com/ganpa3/dotfiles.git $INSTALL_DIR
	fi
else
	if [[ "$SSH" == "true" ]]; then
	    git clone --separate-git-dir=$HOME/.dotfiles git@github.com:ganpa3/dotfiles.git $INSTALL_DIR
	else
	    git clone --separate-git-dir=$HOME/.dotfiles https://github.com/ganpa3/dotfiles.git $INSTALL_DIR
	fi
fi

rsync --recursive --verbose --exclude '.git' $INSTALL_DIR/ $HOME/

git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config status.showUntrackedFiles no
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config core.excludesfile ~/.dotfilesignore

rm --recursive --force $INSTALL_DIR
