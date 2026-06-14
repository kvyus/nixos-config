{ pkgs, lib, ... }:
{
   programs.alacritty = {
      enable = true;
      theme = "gruvbox_dark";
      settings = {
         window = { 
            padding = {
               x = 5;
               y = 5;
            }; 
            opacity = lib.mkForce 1;
         };
      };
   };
}
