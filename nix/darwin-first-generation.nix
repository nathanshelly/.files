{ config, pkgs, ... }:

{
  nix = {
    # enable flakes - https://zimbatm.com/NixFlakes/#other-systems
    # https://daiderd.com/nix-darwin/manual/index.html#opt-nix.extraOptions
    extraOptions = ''experimental-features = nix-command flakes ca-references'';

    # enable flakes, an experimental Nix feature
    # https://daiderd.com/nix-darwin/manual/index.html#opt-nix.package
    package = pkgs.nixFlakes;

    # add ourself as trusted user so that we can run experimental commands
    # https://daiderd.com/nix-darwin/manual/index.html#opt-nix.trustedUsers
    trustedUsers = [ builtins.getEnv "USER" ];
  };

  # create /etc/zshrc that activates the nix-darwin environment on shell load
  programs.zsh.enable = true;

  # auto upgrade nix package and the daemon service
  services.nix-daemon.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
