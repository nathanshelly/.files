# <<<< Disclaimer >>>>
#
# this brewfile will error for you unless you are signed in with an apple id
# that has purchased Super Easy Timer, Bear & Canary Mail. Delete or tweak the
# final block with `mas` installations to avoid these errors (in addition to
# whatever other tweaking you like)
#
# this Brewfile is opinionated in the sense that it's order/comments do not
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

# alternate versions - betas
# ref - https://github.com/Homebrew/homebrew-cask-fonts
tap "homebrew/cask-versions"

# fonts repository
# ref - https://github.com/Homebrew/homebrew-cask-fonts
tap "homebrew/cask-fonts"

# <<<<<<<< packages (formulae) >>>>>>>>

brew "awscli"
brew "coreutils"
brew "fasd"
brew "fd"
brew "fzf"
brew "hub"
brew "git"
# for installing from mac app store
# line must come above usage at end of file
# ref - https://github.com/mas-cli/mas
brew "mas"
brew "neovim"
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
cask "mactex"
cask "marshallofsound-google-play-music-player"
cask "mediahuman-audio-converter"
cask "pocket-casts"
cask "postman"
cask "private-internet-access"
cask "rocket"
cask "slack"
cask "spectacle"
cask "subler"
cask "visual-studio-code"
cask "vivaldi"
cask "vlc"

# << alternate versions >>

cask "google-chrome-canary"

# <<<< fonts >>>>

cask "font-fira-code"

# <<<<<<<< mas (mac app store) applications >>>>>>>>

# for future portability concerns could attempt to match on `mas account`

# << delete/tweak these lines to avoid errors if you have not purchased these >>
mas "Super Easy Timer", id: 1353137878
mas "Canary Mail", id: 1236045954
mas "Bear", id: 1091189122
