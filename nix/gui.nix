{ vars }:

let
  GUI_APPS = "${vars.DOTFILES}/gui/apps";
  PREFERENCES = " Library/Preferences ";
  APPLICATION_SUPPORT = " Library/Preferences ";
in
{
  home.file = {
    ".xvimrc".source = "${vars.DOTFILES}/gui/xvimrc";

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
  };
}
