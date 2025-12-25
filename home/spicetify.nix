
{ pkgs, config, lib, spicetify-nix, ... }:
let
  spicePkgs = spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{ 
  programs.spicetify = 
  {
    enable = true;
    theme = spicePkgs.themes.comfy;
    colorScheme = "Mono";
    enabledExtensions = with spicePkgs.extensions; [
      shuffle
      hidePodcasts
    ];
    enabledSnippets = with spicePkgs.snippets; [
      prettyLyrics 
    ];
  };  
}



