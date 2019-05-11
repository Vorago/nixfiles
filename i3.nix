{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.dmenu
    pkgs.i3lock
    pkgs.i3status
    pkgs.rofi
  ];

  services.xserver = {
    dpi = 192;
    windowManager = {
      i3.enable = true;
      default = "i3";
    };

    displayManager = {
      sessionCommands = ''
        i3status &
      '';
    };
    
    desktopManager = {
      default = "none";
      xterm.enable = false;
    };
  };
  services.compton = {
    enable = true;
    shadow = true;
  };
}
