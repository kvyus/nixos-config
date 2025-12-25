{ pkgs, config, ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
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
