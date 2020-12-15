## Dotfiles

To use, run the following commands:

(Prefered) SSH:
```git clone --separate-git-dir=$HOME/.dotfiles git@github.com:ganpa3/dotfiles.git ~/tmp```

OR

HTTPS: 
```git clone --separate-git-dir=$HOME/.dotfiles https://github.com/ganpa3/dotfiles.git ~/tmp```

```rsync --recursive --verbose --exclude '.git' ~/tmp/ $HOME/```

```rm --recursive ~/tmp```
