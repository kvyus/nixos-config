{ pkgs, config, ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        color = {
          "1" = "#cc241d";
          "2" = "#458588";
        };
      };
      display = {
        color = {
          keys = "#458588";
        };
      };
      modules = [
        "title"
        "separator"
        "os"
        "host"
        "kernel"
        "uptime"
        "shell"
        "de"
        "wm"
        "theme"
        "icons"
        "font"
        "cursor"
        "terminal"
        "cpu"
        "gpu"
        "memory"
        "disk"
        "blocks"
        "break"
      ];
    };
  }; 
}
