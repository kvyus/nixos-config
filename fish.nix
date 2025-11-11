{ config, pkgs, ... }:
{
  programs.fish = {
    interactiveShellInit = ''
      set fish_greeting
    '';
    enable = true;
  };
}
