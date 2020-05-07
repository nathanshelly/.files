# gui

Configuration specific to GUI interaction.

Run `make gui` from the root to set up this gui configuration.

This configuration is written primarily for macOS. It should work on Linux but no promises.

Additionally, parts of this configuration (like Karabiner) are extremely opinionated. Make sure to adjust any configuration to your preferences.

- [`alacritty`](./alacritty) - a cross-platform, GPU-accelerated terminal emulator
- [`apps`](./apps) - configuration for `macOS` GUI apps (e.g. [Alacritty](https://github.com/alacritty/alacritty), [Rectangle](https://github.com/rxhanson/Rectangle), [VSCode](https://github.com/microsoft/vscode))
- [`config.symlink`](./config.symlink) - macOS-specific configuration files symlinked to `$HOME/.config` (e.g. `alacritty`, `karabiner`, `mpv`)
- [`xvimrc.symlink`](./xvimrc.symlink) - configure [XVim2](https://github.com/XVimProject/XVim2) to graft `vim` onto `Xcode`
  - XVim2 installation done manually via [instructions here](https://github.com/XVimProject/XVim2#install).
