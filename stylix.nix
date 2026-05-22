{ pkgs, ... }:
{
   stylix = {
      enable = true;
      polarity = "dark";
      base16Scheme = {
         base00 = "111111"; 
         base01 = "141414";
         base02 = "c75a5a";
         base03 = "3a3a3a"; 
         base04 = "b0b0b0";
         base05 = "d9d9d9"; 
         base06 = "f0f0f0";
         base07 = "ffffff"; 
         base08 = "ef6c6d";
         base09 = "d9d9d9";
         base0A = "bfbfbf";
         base0B = "e6e6e6";
         base0C = "cccccc";
         base0D = "f5f5f5";
         base0E = "c0c0c0";
         base0F = "8a8a8a";
      };
      fonts = {
         serif = {
            package = pkgs.inter;
            name = "Inter";
         };

         sansSerif = {
            package = pkgs.inter;
            name = "Inter";
         };

         monospace = {
            name = "JetBrainsMono Nerd Font";
         };

         emoji = {
            package = pkgs.noto-fonts-color-emoji;
            name = "Noto Color Emoji";
         };
         
         sizes = {
            terminal = 13;
            desktop = 13;
            applications = 13;
         };
      };
      cursor = {
         size = 24;
         package = pkgs.whitesur-cursors;
         name = "WhiteSur-cursors";
      };

   };
}
