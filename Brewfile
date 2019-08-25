# <<<< Disclaimer >>>>
#
# This Brewfile is opinionated in the sense that its order/comments do not
# exactly match the output of `brew bundle dump`
#
# Homebrew recommends against hand editing Brewfiles, advising using
# `brew bundle dump` to generate your brewfile
# ref - https://github.com/Homebrew/homebrew-bundle/issues/341#issuecomment-396978468
#
# I like to add comments, set options & reorder things for my own understanding.

cask_args appdir: '/Applications'

# <<<<<<<< taps >>>>>>>>

# default apps
tap "homebrew/core"

# cask to install casks
tap "homebrew/cask"

# bundle to use `Brewfile`
tap "homebrew/bundle"

# drivers (specifically for Logitech)
# ref - https://github.com/Homebrew/homebrew-cask-drivers
tap "homebrew/cask-drivers"

# alternate versions - betas (e.g. Chrome Canary)
# ref - https://github.com/Homebrew/homebrew-cask-versions
tap "homebrew/cask-versions"

# fonts repository
# ref - https://github.com/Homebrew/homebrew-cask-fonts
tap "homebrew/cask-fonts"

# zsh plugin manager
# ref - https://github.com/getantibody/antibody
tap "getantibody/tap"

# <<<<<<<< packages (formulae) >>>>>>>>

brew "asciinema"
brew "awscli"
brew "bat"
brew "getantibody/tap/antibody"
brew "coreutils"
brew "exa"
brew "fasd"
brew "fd"
brew "fzf"
brew "hub"
brew "git"
brew "mas"
brew "neovim", args: ["HEAD"]
brew "node"
brew "pandoc"
brew "python"
brew "redis"
brew "rename"
brew "ripgrep"
brew "ruby"
brew "terraform"
brew "tldr"
brew "tmux"
brew "trash"
brew "tree"
brew "vim"
brew "wget"
brew "yarn"
brew "zsh"

# <<<<<<<< casks >>>>>>>>

# <<<< apps >>>>

cask "1password"
cask "1password-cli"
cask "alacritty"
cask "alfred"
cask "backblaze"
cask "bartender"
cask "contexts"
cask "daisydisk"
cask "detexify"
cask "docker"
cask "fantastical"
cask "firefox"
cask "flux"
cask "folx"
cask "gitkraken"
cask "google-backup-and-sync"
cask "google-chrome"
cask "istat-menus"
cask "iterm2"
cask "karabiner-elements"
cask "logitech-options"
cask "mactex-no-gui"
cask "marshallofsound-google-play-music-player"
cask "mediahuman-audio-converter"
cask "notion"
cask "pocket-casts"
cask "postman"
cask "private-internet-access"
cask "rocket"
cask "slack"
cask "spectacle"
cask "subler"
cask "visual-studio-code"
cask "vivaldi"

# << alternate versions >>

cask "google-chrome-canary"

# <<<< fonts >>>>

cask "font-fira-code"
