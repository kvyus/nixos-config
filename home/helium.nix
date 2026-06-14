{ pkgs, config, ... }:

{
   programs.helium = {
      enable = true;
      extensions = [
      ];

      extraFlags = [
         "--force-dark-mode"
      ];

      extraPolicies = {
         HomepageLocation = "https://start.duckduckgo.com";
         DeveloperToolsAvialability = 1;
      };
      preferences = {
         browser.show_home_button = false;
      };
   };
}
