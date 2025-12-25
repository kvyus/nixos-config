{ config, pkgs, ...}:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "GeistMono Nerd Font";
      size = 11;
    };
    settings = {
      background = "#282828";
      cusros_shape = "beam";
      cursor_trail = 1;
      confirm_os_window_close = 0;
      background_opacity = 0.8;
    };
    keybindings = {
      "ctrl+plus" = "change_font_size all +1";
      "ctrl+minus" = "change_font_size all -1";
    };
    themeFile = "GruvboxMaterialDarkMedium";
  };
}
