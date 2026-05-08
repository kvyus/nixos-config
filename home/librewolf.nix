{ pkgs, ... }:
{
   stylix.targets.librewolf.profileNames = ["main"];

   programs.librewolf = {
      enable = true;
      profiles.main = {
         isDefault = true;
         id = 0;
      };
   };
}
