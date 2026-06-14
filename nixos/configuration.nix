
{ config, pkgs, ... }:

{
   imports = [ 
      ./hardware-configuration.nix
      ../stylix.nix
      ./services.nix
   ];

   boot.loader.grub.enable = true;
   boot.loader.grub.device = "nodev";
   boot.loader.grub.useOSProber = true;
   boot.loader.grub.efiSupport = true;
   boot.loader.efi.canTouchEfiVariables = true;

   networking.hostName = "nixos"; 

   networking.networkmanager.enable = true;
   networking.networkmanager.wifi.powersave = false;

   time.timeZone = "Europe/Kyiv";

   i18n.defaultLocale = "en_US.UTF-8";

   i18n.extraLocaleSettings = {
      LC_ADDRESS = "uk_UA.UTF-8";
      LC_IDENTIFICATION = "uk_UA.UTF-8";
      LC_MEASUREMENT = "uk_UA.UTF-8";
      LC_MONETARY = "uk_UA.UTF-8";
      LC_NAME = "uk_UA.UTF-8";
      LC_NUMERIC = "uk_UA.UTF-8";
      LC_PAPER = "uk_UA.UTF-8";
      LC_TELEPHONE = "uk_UA.UTF-8";
      LC_TIME = "uk_UA.UTF-8";
   };

   xdg.portal = {
      enable = true;
      wlr = {
         enable = true;
         settings = {
            screencast = {
               output_name = "HDMI-A-1";
               max_fps = 100;
               chooser_type = "simple";
               chooser_cmd = "${pkgs.slurp}/bin/slurp -f 'Monitor: %o' -or";
            };
         };
      };
      extraPortals = with pkgs; [
         xdg-desktop-portal-hyprland
         xdg-desktop-portal-gtk
      ];
      config = {
         mango = {
            default = [
               "gtk"
            ];
            "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
            "org.freedesktop.impl.portal.ScreenCast" = [ "wlr" ];
         };
      };
   };

   programs.zsh.enable = true;

   users.users.cherv = {
      isNormalUser = true;
      description = "cherv";
      extraGroups = [ "networkmanager" "wheel" ];
      shell = pkgs.zsh;
   };

   nix.settings.experimental-features = [ "nix-command" "flakes" ]; 

   hardware.graphics = {
      enable = true;
      enable32Bit = true;
   };

   programs.fish.enable = true;

   programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
      extraCompatPackages = with pkgs; [ proton-ge-bin ];
   };

   programs.gamemode.enable = true;

   nixpkgs.config.allowUnfree = true;

   environment.systemPackages = with pkgs; [
      curl
      git
      home-manager
      vesktop
      ayugram-desktop
      zoom-us
      spotify
      fastfetch
      wl-clipboard
      killall
      slurp
   ];

   fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
   ];

   nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
   };
   
   system.stateVersion = "26.05";
}
