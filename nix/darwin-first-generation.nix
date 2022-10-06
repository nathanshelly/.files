{ config, pkgs, ... }:


let
  USER = "${builtins.getEnv "USER"}";
in
{
  nix = {
    configureBuildUsers = true;

    # enable flakes - https://zimbatm.com/NixFlakes/#other-systems
    # https://daiderd.com/nix-darwin/manual/index.html#opt-nix.extraOptions
    # TODO: remove these?
    extraOptions = ''
      experimental-features = nix-command flakes
      extra-platforms = aarch64-darwin x86_64-darwin
    '';

    # add ourself as trusted user so that we can run experimental commands
    # https://daiderd.com/nix-darwin/manual/index.html#opt-nix.settings.trusted-users
    settings.trusted-users = [ USER ];
  };

  # create /etc/zshrc that activates the nix-darwin environment on shell load
  programs.zsh.enable = true;

  # auto upgrade nix package and the daemon service
  services.nix-daemon.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
