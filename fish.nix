{ config, pkgs, ... }:
{
  programs.fish = {
    interactiveShellInit = ''
      set fish_greeting
      set -g fish_color_normal       "#ebdbb2"
      set -g fish_color_command      "#fabd2f"
      set -g fish_color_param        "#b8bb26"
      set -g fish_color_error        "#fb4934"
      set -g fish_color_comment      "#928374"
      set -g fish_color_quote        "#b16286"
      set -g fish_color_redirection  "#fe8019"
      set -g fish_color_operator     "#83a598"
      set -g fish_color_search_match "#d3869b"
      set -g fish_color_selection    "#504945"
      set -g fish_color_cursor       "#fbf1c7"
    '';
    enable = true;
    plugins = [
      { name = "gruvbox"; src = pkgs.fishPlugins.gruvbox; }
    ];
  };
}
