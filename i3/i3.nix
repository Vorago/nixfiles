{ config, pkgs, ... }:

let
  i3-quickterm = pkgs.stdenv.mkDerivation {
    name = "i3-quickterm";
    buildInputs = [
      (pkgs.python37.withPackages (pythonPackages: with pythonPackages; [
        i3ipc
      ]))
    ];
    unpackPhase = ":";
    installPhase = "install -m755 -D ${./i3-quickterm.py} $out/bin/i3-quickterm";
  };
in
{
  environment.systemPackages = [
    i3-quickterm
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