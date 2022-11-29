pathToDotfiles:

{ pkgs, ... }:

# { HOME, USER }:

{
  # home-manager specific
  home.username = "nathan";
  home.homeDirectory = "/home/ubuntu";
  home.packages = with pkgs; [
    # TODO: https://github.com/haslersn/any-nix-shell#zsh
    any-nix-shell
    awscli
    bat
    deno
    du-dust
    exa
    exiftool
    fd
    # delta
    gh
    tig
    httpie
    hyperfine
    jq
    lua # z.lua dependency
    kubectx
    kubernetes
    mdcat
    ncurses
    nil
    # nodejs
    nodejs-16_x
    nix-index
    # python3
    ripgrep
    rsync
    ruplacer
    shellcheck
    shfmt
    stern
    syncthing
    tldr
    terraform-lsp
    tmux
    tree-sitter
    tokei
    tree
    vim
    vivid
    watchexec
    yarn
  ];

  home.sessionVariables = {
    CURRENT_USER_EMAIL = "nathan.shelly@opendoor.com";
    OD_CURRENT_USER_EMAIL = "nathan.shelly@opendoor.com";
    VAULT_ADDR = "https://vault.services.opendoor.com:8200";
  };

  # creates symlinks to immutable copies of the source file in /nix/store
  # form: "<target>".source = "<source>"
  home.file = {
    ".tmux.conf".source = "${pathToDotfiles}/tmux/tmux.conf";

    # ##### neovim #####
    # # extra configuration for `coc.nvim` plugin
    # "${config.xdg.configHome}/nvim/coc-settings.json".source = "${pathToDotfiles}/neovim/coc-settings.jsonc";
    # # custom colorscheme
    # "${config.xdg.configHome}/nvim/colors/n.vim".source = "${pathToDotfiles}/neovim/colors/n.vim";
  };

  # ref - https://rycee.gitlab.io/home-manager/options.html#opt-programs.command-not-found.enable
  programs.command-not-found.enable = true;

  # configures shell hook to initialize direnv for zsh + nix-direnv integration
  # refs:
  # - https://rycee.gitlab.io/home-manager/options.html#opt-programs.direnv.enable
  # - direnv - https://direnv.net/
  programs.direnv = {
    enable = true;

    # configure $HOME/.config/direnv/direnvrc to source nix-direnv initialization
    # ref - https://github.com/nix-community/nix-direnv#via-home-manager
    nix-direnv.enable = true;
  };

  #   # sources completions and key-bindings in interactive zsh sessions
  #   # ref - https://rycee.gitlab.io/home-manager/options.html#opt-programs.fzf.enable
  programs.fzf.enable = true;

  programs.git = import ./git.nix;

  # let Home Manager install and manage itself
  programs.home-manager.enable = true;

  programs.neovim = import ./editor.nix { inherit pathToDotfiles pkgs; };

  programs.zsh = {
    enable = true;

    # TODO: try this - https://github.com/nix-community/home-manager/issues/1338

    # TODO: apply conditionally based on user config, rewritten in nix
    defaultKeymap = "viins";

    initExtra = builtins.concatStringsSep "\n" [
      (builtins.readFile "${pathToDotfiles}/zsh/zshrc")
      # TODO: see if there's a better way to do this
      "source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh"
      # TODO: try and extend this to `nix develop` & `nix run` commands
      "any-nix-shell zsh --info-right | source /dev/stdin"
      ''
        OD_CODE_ROOT="/Users/nathan/work/go/src/github.com/opendoor-labs/code"
        OD_TOOL_SOURCE_SCRIPT="$OD_CODE_ROOT/scripts/infra/sourced_on_shell_load.sh"
        [ -f "$OD_TOOL_SOURCE_SCRIPT" ] && source "$OD_TOOL_SOURCE_SCRIPT"

        EC2_SCRIPT_PATH="$GOPATH/src/github.com/opendoor-labs/code/scripts/bin/ec2_script.sh"
        [ -f "$EC2_SCRIPT_PATH" ] && source "$EC2_SCRIPT_PATH"
      ''
    ];
    envExtra = builtins.readFile "${pathToDotfiles}/zsh/zshenv";

    shellAliases = {
      # `exa` - prettier replacement for `ls`
      # options - https://github.com/ogham/exa#options
      l = "exa";
      la = "exa --all";
      ll = "exa --long --all";

      "," = "comma";
      "k" = "kubectl";
      "kns" = "kubectl -n staging";
      "knq" = "kubectl -n qa";
      "knp" = "kubectl -n production";
    };
  };

  # this machine-specific value should correspond to the nix version at the time
  # home-manager was first used to set up that machine
  # TODO: abstract this out to machine-specific file

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";
}
