# nix

These dotfiles are declared and applied via [Nix](https://nixos.org/) (and the Nix ecosystem).

## toc

- [the goal](#the-goal)
- [why Nix](#why-nix)
- [how it works at a high-level](#how-it-works-at-a-high-level)
- [Nix ecosystem](#nix-ecosystem)
- [how it works at a lower level](#how-it-works-at-a-high-level)
  - [macOS](#macos)
  - [Linux flavors](#linux-flavors)
  - [NixOS](#nixos)
- [tradeoffs](#tradeoffs)
- [alternatives](#alternatives)

## the goal

A declarative, replicable config comprising everything that makes my dotfiles the unique snowflake they are ❄️

This configuration should work gracefully on any Unixy system and specify all meaningful configuration including the development environment (shell, editor, color schemes, etc.), user packages, OS settings (keyboard shortcuts, appearance, etc.), background services (`postgresql`, `redis`, etc.) and more.

## why Nix

The Nix ecosystem provides tooling to enable declarative specification and replicable application of much (and growing) of my dotfiles in the Nix language.

Pre-Nix these dotfiles applied themselves via shell scripts. I actually kind of enjoy writing shell scripts (shellcheck, shfmt, and a bash language server make a huge difference for me) but that's still a fragile system supported only by me.

Instead of that fragile collection of imperative shell scripts Nix enables a flexible, composable configuration that glues together disparate bits of config with a more consistent structure.

## how it works at a high-level

In practice a configuration boils down to putting files in expected locations. For example, `zsh` will respect any configuration in a `$HOME/.zshrc` file (and others like `/etc/zshrc`, `$HOME/.zshenv`, etc.). These files may be read directly by the program or they may set features of an environment (like environment variables or shell aliases) that apply to the tool when run in that environment. Even the act of installing a package in the end just comes down to putting the corresponding binary in a folder on your `$PATH`.

> There are, of course, exceptions to this general principle. macOS system settings for example are written via `defaults write` which updates a SQLite (TODO: double check this) database.

The complexity of a dotfiles configuration comes primarily from the sheer variety of files/expected locations and the occasional need to interface with a third party tool to move a given file to its corresponding location. For example, to install a given package one needs to interface with a package manager (`apt`, `yum`, `brew`, etc.).

Nix tooling abstracts this complexity away by providing a consistent interface to declare a wider range of config than any other tool I'm aware of. This varies from the least abstract symlinking of arbitrary files to setting high-level keys in a corresponding module which Nix tooling realizes by writing the corresponding files.

In the high-level key case the Nix ecosystem has created a wrapper around a bit of config that makes declaring it as simple as setting the value of a specific key. For example, this [`system.defaults.NSGlobalDomain._HIHideMenuBar`](TODO: fill this) key controls whether or not the macOS menu bar is hidden. This [`users.users.nathan.packages`](TODO: fill this) key specifies the set of packages available to the `nathan` user. Nix tooling performs the actions required to apply this config: writing files, installing a package, flipping a macOS setting, etc.

In other situations it may make more sense to declare a bit of config in its own file. To apply this config the file needs to be moved to the expected location for it. For example, [this key](TODO: fill this) causes Nix to apply the [`tmux.conf`](../tmux/tmux.conf) config in these dotfiles by moving it to `~/.tmux.conf`.

> Arbitrary config code can also be inlined in `.nix` files via the """...""" syntax. See [here](TODO: fill this) for example. Nix tooling will then write this config into a file in the expected location for the corresponding tool.

## Nix ecosystem

The Nix umbrella includes multiple projects that when combined approach this goal better than any other system I am currently aware of.

These projects are:

- the Nix language tuned specifically for declarative, replicable configuration
- the Nixpkgs package manager
- Home Manager - a tool for managing the development environment (shell, editor, CLI tools, etc.)
- OS-specific tooling
  - NixOS - an operating system built completely atop Nix thus supporting perfectly replicable, declarative configuration
  - nix-darwin - an tool to declaratively manage macOS (Darwin) similar to NixOS

Together these projects enable the most portable possible specification of these dotfiles across NixOS, macOS and other Linux flavors.

## how it works at a lower level

### macOS

Supported.

Configuration is split in two files:

- [`darwin.nix`](./darwin.nix) - the entrypoint, applies the configuration in `home.nix` and defines everything else: user accounts/packages, keyboard shortcuts, UI, background services, etc.
- [`home.nix`](./home.nix) - defines the development environment via [Home Manager](https://rycee.gitlab.io/home-manager/)
  - Home Manager can manage this configuration independently but these dotfiles apply the config [via the `nix-darwin` module](TODO: fill this in) ([docs](https://rycee.gitlab.io/home-manager/index.html#sec-install-nix-darwin-module))

Home Manager and `nix-darwin` helpfully abstract away much of the complexity of applying our configuration. Various modules provide high-level keys to configure behavior of the underlying tool.

### Linux flavors

Theoretically supported, not yet tested.

[Home Manager](https://rycee.gitlab.io/home-manager/) applies the configuration in [`home.nix`](./home.nix) defining the development environment (shell, editor, etc.).

### NixOS

Not yet supported.

## tradeoffs

The most noticeable tradeoff of Nix for a generic user of these dotfiles is likely to be the immutability of written config files. By design Nix writes all files to the store (`/nix/store`) and then symlinks these files into their appropriate locations. Because the Nix store is immutable it is impossible to write to these symlinks.

This means one cannot edit `~/.zshrc` directly. Instead you have to edit `$DOTFILES/zsh/zshrc` and then re-apply the configuration via `make apply`.

This has particularly poor implications for managing GUI app configs since using Nix to do so prevents updating settings via the native interface provided by the app in question. For now these dotfiles sidestep this issue by managing GUI configs via imperative shell scripts instead of Nix tooling.

## alternatives

- https://yadm.io/
- https://github.com/MikeMcQuaid/strap
