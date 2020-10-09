# python dependency manager
[[ -d "$HOME/.poetry/bin" ]] && path=("$HOME/.poetry/bin" $path)

# put nix profile first on path
[[ -d "/etc/profiles/per-user/$USER/bin" ]] && {
  path=("/etc/profiles/per-user/$USER/bin" $path)
}

# where `pip install --user` installs executables
[[ -d "$HOME/.local/bin" ]] && path=("$HOME/.local/bin" $path)

[[ -d "$HOME/.cargo/bin" ]] && path=("$HOME/.cargo/bin" $path) # rust packages
