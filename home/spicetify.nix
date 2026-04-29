{ pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
   programs.spicetify = {
      enable = true;
#      theme = spicePkgs.themes.text;
#      colorScheme = "Gruvbox";
      enabledExtensions = with spicePkgs.extensions; [
         shuffle
         hidePodcasts
      ];
      enabledSnippets = with spicePkgs.snippets; [
         prettyLyrics 
      ];
   };
}
