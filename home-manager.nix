{ lib, pkgs, ... }:
let
  home-manager = builtins.fetchGit {
    url = "https://github.com/rycee/home-manager.git";
    rev = "14a0dce9e809d222a85ad19aa7d3479cc104e475";
    ref = "release-19.03";
  };
  name = "Andrew Naydyonock";
  email = "a.vorago@gmail.com";
  githubUsername = "vorago";
  font = "Hack";
in
{
  imports = [
    "${home-manager}/nixos"
  ];

  home-manager.users.vorago = {
    programs = {
      git = {
        enable = true;
        userName = "${name}";
        userEmail = "${email}";
      };
      rofi = {
        enable = true;
        font = "${font} 20";
        theme = "solarized";
      };
      vim = {
        enable = true;
        settings = { ignorecase = true; };
      };
    };
    
    xresources.properties = {
      "Xft.antialias" = 1;
      "Xft.autohint" = 0;
      "Xft.dpi" = 192;
      "Xft.hinting" = 1;
      "Xft.hintstyle" = "hintfull";
      "Xft.lcdfilter" = "lcddefault";
      "Xcursor.theme" = "breeze_cursors";
      "Xcursor.size" = 48;
    };

    home.file = {
      ".config/fish/functions".source = ./theme-bobthefish/functions;
      ".config/fish/fish_mode_prompt.fish".source = ./theme-bobthefish/fish_mode_prompt.fish;
      ".config/fish/fish_prompt.fish".source = ./theme-bobthefish/fish_prompt.fish;
      ".config/fish/fish_right_prompt.fish".source = ./theme-bobthefish/fish_right_prompt.fish;
      ".config/fish/fish_title.fish".source = ./theme-bobthefish/fish_title.fish;
      ".config/i3/i3-quickterm.json".source = i3/i3-quickterm.json;
    };
  };
}
