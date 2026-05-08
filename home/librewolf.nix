{ pkgs, lib, ... }:
{
   stylix.targets.librewolf = {
      profileNames = ["main"];
      enable = true;
   };
   programs.librewolf = {
      enable = true;

      profiles.main = {
         isDefault = true;
         id = 0;
         settings = {
            "browser.tabs.closeWindowWithLastTab" = false;
            "sidebar.verticalTabs" = true;
            "font.size.monospace.x-western" = lib.mkForce 13;
            "font.size.variable.x-western" = lib.mkForce 13;
         };
      };
   };
}
