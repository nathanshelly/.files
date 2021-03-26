# setup

> GUI configuration currently only supports macOS

## getting started

```shell
$DOTFILES/gui/setup/setup_gui
```

> can also run `make gui` from the repo root

## scripts

Various setup scripts

### entry point

[`setup_gui`](./setup_gui) triggers installation of configuration related to GUI applications (non-terminal configuration).

### additional scripts

- [`setup_brew`](./setup_brew) - install [Homebrew](https://brew.sh) for `casks` (macOS desktop apps)
- [`setup_desktop_apps`](./setup_desktop_apps) - installs all desktop apps I use via [`brew cask`](https://github.com/Homebrew/homebrew-cask/) & [`mas`](https://github.com/mas-cli/mas)
