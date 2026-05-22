{ pkgs, ... }:
{
   programs.alacritty = {
      enable = true;
      theme = "gruvbox_dark";
      settings = {
         window.padding = {
            x = 5;
            y = 5;
         }; 
      };
   };
}
