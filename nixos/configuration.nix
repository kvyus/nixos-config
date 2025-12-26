
{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixtyashke";

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  

  environment.variables = {
    EDITOR = "nvim";    
  };

  # --- GPU (AMD RX 6500 XT) ---
  services.xserver.videoDrivers = [ "amdgpu" ];
  services.displayManager.sddm = {
    wayland.enable = true;
    enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  programs.neovim = {
    enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Vulkan и графический стек
  environment.systemPackages = with pkgs; [
    # Система и утилиты
    git
    wget
    curl
    kitty
    waybar
    cava
    firefox
    vlc
    zoom-us
    telegram-desktop
    discord
    flatpak
    hypridle
    killall
    swaylock
    fastfetch
    sqlite
    hyprpaper
    hyprshot
    hyprlock
    home-manager
    nodejs
    android-file-transfer
    libmtp
    gtk4
    gtk3
    materia-theme
    papirus-icon-theme
    unzip
    go
    lua
    wl-clipboard
    rustc
    cargo
    wirelesstools

    # Vulkan / графика
    mangohud

    # Базовый набор сборки
    gcc
    gnumake
    pkg-config
  ];
  
  nix.settings = {
  experimental-features = [ "nix-command" "flakes" ];
  };

  # Сеть
  networking.networkmanager.enable = true;

  # Время и локаль
  time.timeZone = "Europe/Kyiv";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "us";

  # Пользователь
  users.users.unvoid = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "input" "games" ];
    shell = pkgs.zsh;
  };

  # Sudo
  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = true;

  # Аудио (PipeWire)
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  
  programs.gamemode.enable = true;
  # Wayland / Hyprland
  programs.hyprland.enable = true;

  # zsh shell
  programs.zsh.enable = true;

  # Flatpak
  services.flatpak = {
    enable = true;
    packages = [
       "org.vinegarhq.Sober"
       "ru.linux_gaming.PortProton"
    ];
  };

  # --- Steam ---
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    extraCompatPackages = with pkgs; [proton-ge-bin];
  };

  # Порталы и D-Bus
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
  };

  # Шрифты
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    noto-fonts-cjk-sans
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.hack
    nerd-fonts.geist-mono
    cascadia-code
    font-awesome
  ];

  # Фаерволл отключён — не нужен
  networking.firewall.enable = false;

  system.autoUpgrade.enable = true;
  system.stateVersion = "26.05";
}
