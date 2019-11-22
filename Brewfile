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

# alt
# ref - https://github.com/uptech/alt
tap "uptech/homebrew-oss"

# delta
# ref - https://github.com/dandavison/delta
tap "dandavison/delta", "https://github.com/dandavison/delta"

# <<<<<<<< packages (formulae) >>>>>>>>

# install a modern version of `gcc`
# installed first so that it's used to compile later packages
brew "gcc"

brew "alt"
brew "asciinema"
brew "awscli"
brew "bat"
brew "coreutils"
brew "dust"
brew "exa"
brew "exiftool"
brew "fasd"
brew "fd"
brew "fzf"
brew "git"
brew "git-delta"
brew "hub"
brew "hyperfine"
brew "mas"
brew "mdcat"
brew "neovim", args: ["HEAD"]
brew "pandoc"
brew "pastel"
# https://github.com/gpakosz/.tmux#accessing-the-macos-clipboard-from-within-tmux-sessions
brew "reattach-to-user-namespace"
brew "redis"
brew "rename"
brew "ripgrep"
brew "rsync"
brew "shfmt"
brew "terraform"
brew "tig"
brew "titlecase"
brew "tldr"
brew "tmux"
brew "trash"
brew "tree"
brew "vim"
brew "watchexec"
brew "wget"
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
cask "kap"
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
