{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # TODO: remove when no longer necessary
  # ref - https://github.com/nix-community/home-manager/issues/254
  # manual.manpages.enable = false;

  # home.file = {
  #   "$DOTFILES/"
  # };

  # programs.chromium.enable = true;
  # programs.command-not-found.enable = true;
  # ref - https://rycee.gitlab.io/home-manager/options.html#opt-programs.dircolors.enable

  programs.zsh.enable = true;

  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.enableNixDirenvIntegration = true;

  # programs.dircolors.enable = true;
  # programs.dircolors.enableZshIntegration = true;


  # programs.firefox.enable = true;
  # programs.fzf.enable = true;
  # TODO: understand why this doesn't work
  # programs.fzf.enableZshIntegration = true;
  # programs.git.delta.enable
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.git.signing
  # programs.gpg.enable
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.home-manager.path
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.keychain.enable
  # neovim
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.neovim.enable

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.03";
}
