## Dotfiles

If you have ssh configured with GitHub, run
```
curl -fsS https://raw.githubusercontent.com/ganpa3/dotfiles/main/install.sh | bash -s -- --ssh
```
else run
```
curl -fsS https://raw.githubusercontent.com/ganpa3/dotfiles/main/install.sh | bash
```

For the minimal version:

If you have ssh configured with GitHub, run
```
curl -fsS https://raw.githubusercontent.com/ganpa3/dotfiles/main/install.sh | bash -s -- --minimal --ssh
```
else run
```
curl -fsS https://raw.githubusercontent.com/ganpa3/dotfiles/main/install.sh | bash -s -- --minimal
```

This will replace your current configs.
