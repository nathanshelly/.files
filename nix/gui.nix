{ nixpkgs, USER }:

let
  brewBinPrefix = "/opt/homebrew/bin"; # if nixpkgs.system == "aarch64-darwin" then "/opt/homebrew/bin" else "/usr/local/bin";
in
{
  homebrew = {
    enable = true;

    # uninstalls formulae & casks that are not listed in the brewfile
    # cleanup = "zap";

    brewPrefix = brewBinPrefix;

    # prevents homebrew from generating useless lock files
    global.lockfiles = false;

    # how to make these install arm versions?
    # just run in correct bash environment?
    casks = [
      "1password"
      # try creating a custom module? this may only work because Linux doesn't have
      # the same `/usr/local/bin/` directory requirement
      # ref: https://github.com/NixOS/nixpkgs/blob/nixos-22.11/nixos/modules/programs/_1password.nix
      # command -v op && {
      #   # support "Connect with 1Password CLI` in GUI app
      #   # TODO: revisit value of this connection
      #   # TODO: make this cross-plat?
      #   mkdir -p "/usr/local/bin"
      #   info "Linking 1Password CLI"
      #   "$DOTFILES/infra/setup/bin/link_file" "$(which op)" "/usr/local/bin/op"
      # }
      "1password-cli"
      "alfred"
      "alt-tab"
      "backblaze"
      "bartender"
      "contexts"
      "daisydisk"
      "discord"
      "fantastical"
      "firefox"
      "flux"
      "google-chrome"
      "google-drive"
      "istat-menus"
      "iterm2"
      "karabiner-elements"
      "keycastr"
      "microsoft-edge"
      "monitorcontrol"
      "mpv"
      "notion"
      "private-internet-access"
      #"postman"
      "rectangle"
      "signal"
      "slack"
      "spotify"
      "steermouse"
      "topnotch"
      "ueli"
      "visual-studio-code"
      "vlc"
    ];
  };

  home-manager.users.${USER} = {
    # someday may manage other gui configs via nix but immutability prevents
    # editing settings via the gui which is a dealbreaker for me at the moment
    home.file = {
      ".xvimrc".text = ''
        " Options

        set wrap
        set number

        set incsearch
        set hlsearch

        set ignorecase
        set smartcase

        " Mappings

        inoremap jk <esc>

        nnoremap J }
        vnoremap J }
        nnoremap K {
        vnoremap K {

        nnoremap z $
        vnoremap z $h
        nnoremap Z ^
        vnoremap Z ^

        nmap == :xcmenucmd Re-Indent<CR>
        vmap = :xcmenucmd Re-Indent<CR>

        nmap <C-i> :xcmenucmd Go Forward<CR>
        nmap <C-o> :xcmenucmd Go Back<CR>

        nmap <C-z> :xcmenucmd Open in Next Editor<CR>
        nmap <C-q> :xcmenucmd Close Editor<CR>:xcmenucmd Move Focus to Next Editor<CR>
      '';
    };
  };
}
