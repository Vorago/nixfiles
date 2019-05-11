# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./i3.nix
      ./home-manager.nix
    ];
  nixpkgs.config.allowUnfree = true;
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "mad-chameleon"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  time.timeZone = "Europe/Riga";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    git
    google-chrome
    compton
    rofi

    slack
    docker
    kubectl

    ag
    bat
    fd

    termite
    fish
    fzf

    pcmanfm
    acpilight # xbacklight
  ];

  environment.variables = {
    # HiDPI Settings
    PLASMA_USE_QT_SCALING = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "0";
    QT_QPA_PLATFORM = "xcb";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_QUICK_CONTROLS_STYLE = "org.kde.desktop";
    QT_SCREEN_SCALE_FACTORS = "eDP1=2;HDMI1=2;VIRTUAL1=2;";
    XCURSOR_THEME = "breeze_cursors";
    XCURSOR_SIZE = "48";

    # Preferred applications
    EDITOR = "vim";
    BROWSER = "google-chrome-stable";
  };

  programs.fish.enable = true;

  virtualisation.docker.enable = true;

  # sound.enable = true;
  # hardware.pulseaudio.enable = true;
  hardware.brightnessctl.enable = true;

  services.xserver.enable = true;
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  users.users.vorago = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" "video" "docker" ];
  };
  
  fonts.enableFontDir = true;
  fonts.enableGhostscriptFonts = true;
  fonts.fonts = with pkgs; [
    terminus_font
    noto-fonts
    fira-code
    fira-code-symbols
  ];

  system.stateVersion = "19.03";

}
