{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./i3.nix
      ./home-manager.nix
    ];
  nixpkgs.config.allowUnfree = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "mad-chameleon";
  networking.wireless.enable = true;

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  time.timeZone = "Europe/Riga";

  environment.systemPackages = with pkgs; [
    vim
    git
    google-chrome
    keepassxc
    insync

    # i3
    compton
    rofi

    # work
    jetbrains.idea-ultimate
    slack
    docker
    kubectl

    # util
    ag
    bat
    fd
    pcmanfm
    acpilight # xbacklight
    thefuck

    # python
    python3
    pythonPackages.i3ipc

    # shell
    termite
    fish
    fzf
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
  services.xserver.layout = "us,ru";
  services.xserver.xkbOptions = "grp:caps_toggle";
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
