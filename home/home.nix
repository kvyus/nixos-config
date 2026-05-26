{ config, pkgs, ... }:
{
   imports = [
      ./nvf.nix
      ./hyprland.nix
      ./fish.nix
      ./waybar.nix
      ./yazi.nix
      ./spicetify.nix
      ./alacritty.nix
      ./fuzzel.nix 
      ./git.nix
      ../stylix.nix
      ./firefox.nix
      ./mango.nix
      ./zsh.nix
   ];
   home.username = "cherv";
   home.homeDirectory = "/home/cherv";

   home.stateVersion = "26.05";
   home.enableNixpkgsReleaseCheck = false;

   nixpkgs.config.allowUnfree = true; 

   home.packages = with pkgs; [
      obsidian
      bat
      lsd
      awww
      btop
      pavucontrol
      nwg-look
      vscodium
      imv
      nemo
      nerd-fonts.geist-mono
      vlc
      lxappearance
   ];

   gtk = {
      enable = true;
      iconTheme = {
         package = pkgs.tela-circle-icon-theme.override { colorVariants = [ "red" ]; };
         name = "Tela-circle-red";
      };
      gtk4 = {
         enable = true;
         theme.name = "gruvbox-dark";
         font = {
            name = "JetBrainsMono Nerd Font";
            size = 13;
         };
         iconTheme = {
            package = pkgs.tela-circle-icon-theme.override { colorVariants = [ "red" ]; };
            name = "Tela-circle-red";
         };
      };
   };

   home.sessionVariables = {
      EDITOR = "nvim";
   };

   programs.obs-studio.enable = true;
   
   programs.quickshell = {
      enable = true;
      systemd.enable = true;
      systemd.target = "hyprland-session.target";
      configs = {
         def = ./quickshell;
      };
   };

   programs.emacs = {
      enable = true;
   };

   services.mako.enable = true;

   programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableFishIntegration = true;
   };

   programs.home-manager.enable = true;
 
} 
