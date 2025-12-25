{ config, pkgs, ... }:
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  imports = [
    ./nvf.nix
    ./zsh.nix
    ./kitty.nix
    ./hypr.nix
    ./spicetify.nix
    ./fastfetch.nix
  ];
  home.username = "unvoid";
  home.homeDirectory = "/home/unvoid";

  home.stateVersion = "25.11";

  # The home.packages option allows you to install Nix packages into your
  # environment.
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    onlyoffice-desktopeditors
    cargo
    quickshell
    btop
    pfetch
    nemo
    obs-studio
  ];  
  gtk = {
    enable = true;
    theme = {
      package = pkgs.orchis-theme.override { tweaks = ["submenu"]; };
      name = "Orchis-Grey-Dark";

    };
    font.name = "GeistMono Nerd Font";
    font.size = 11;
    iconTheme = {
      package = pkgs.tela-circle-icon-theme.override { colorVariants = [ "grey" ]; };
      name = "Tela-circle-grey";
    };
  };
  
  programs.quickshell = {
    enable = true;
  };
  
  programs.vscode.enable = true;
  programs.helix = {
    enable = true;
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-dark";
    size = 24;
    x11.enable = true;
  };
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    SUDO_EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
