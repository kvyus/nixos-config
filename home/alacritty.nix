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
#         font.normal = {
#            family = "JetBrainsMono Nerd Font";
#            style = "Regular";
#         };

#         font.bold = {
#            family = "JetBrainsMono Nerd Font";
#            style = "Bold";
#         };

#         font.italic = {
#            family = "JetBrainsMono Nerd Font";
#            style = "Italic";
#         };

#         font.bold_italic = {
#            family = "JetBrainsMono Nerd Font";
#            style = "Bold Italic";
#         };

#         font.size = 13.0;
      };
   };
}
