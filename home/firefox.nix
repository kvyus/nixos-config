{ pkgs, ... }:
{
   stylix.targets.firefox.profileNames = [ "main" ];
   programs.firefox = {
      enable = true;
      profiles.main = {
         isDefault = true;
         settings = {
            "sidebar.verticalTabs" = true;
         };
      };
   };
}
