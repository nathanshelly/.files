{ vars }:

let
  GUI_APPS = "${vars.DOTFILES}/gui/apps";
  PREFERENCES = " Library/Preferences ";
  APPLICATION_SUPPORT = " Library/Preferences ";
in
{
  home.file = {
    "${vars.XDG_CONFIG_HOME}/alacritty/alacritty.yml".source =
      "${GUI_APPS}/alacritty/alacritty.yml";

    # window organization/resizing
    "${PREFERENCES_FOLDER}/com.knollsoft.Rectangle.plist".source =
      "${GUI_APPS}/rectangle/com.knollsoft.Rectangle.plist";

    # window switcher
    "{PREFERENCES_FOLDER}/com.lwouis.alt-tab-macos.plist".source =
      "${GUI_APPS}/alt-tab/com.lwouis.alt-tab-macos.plist";

    # launcher (Alfred, Spotlight, Windows search, etc.)
    "${APPLICATION_SUPPORT}/ueli/config.json".source =
      "${GUI_APPS}/ueli/config.json";

    # VSCode - text editor
    "${APPLICATION_SUPPORT}/Code/User/keybindings.json".source =
      "${GUI_APPS}/vscode/keybindings.json";

    "${APPLICATION_SUPPORT}/Code/User/settings.json".source =
      "${GUI_APPS}/vscode/settings.json";

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
}
