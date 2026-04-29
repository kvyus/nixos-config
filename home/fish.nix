{ pkgs, ... }:
{
   programs.fish = {
      enable = true;
      shellAliases = {
         v = "nvim";
         l = "lsd";
         la = "lsd -a";
         c = "cd";
         ff = "fastfetch";
      };
      plugins = [
         {
            name = "gruvbox";
            src = pkgs.fishPlugins.gruvbox.src;
         }
      ];
   };
}
