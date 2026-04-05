{ config, pkgs, ... }:

{
  imports = [
    ./modules/cursor.nix
  ];
  
  home.file = {
  ".config/caelestia".source = ./configs/caelestia;
  ".config/kitty".source = ./configs/kitty;
  ".config/hypr".source = ./configs/hypr;
  ".config/btop".source = ./configs/btop;
  ".config/fastfetch".source = ./configs/fastfetch;
  ".config/mpv".source = ./configs/mpv;
  ".config/rofi".source = ./configs/rofi;
};

  home.username = "flozz";
  home.homeDirectory = "/home/flozz";

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
