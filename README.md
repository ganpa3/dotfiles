## Dotfiles

If you have ssh configured with GitHub, run
```
curl -fsS https://raw.githubusercontent.com/ganpa3/dotfiles/main/install.sh | bash -s ssh
```
else run
```
curl -fsS https://raw.githubusercontent.com/ganpa3/dotfiles/main/install.sh | bash
```
This will replace your current configs.

Run this to hide untracked files: ```dfg config status.showUntrackedFiles no```
