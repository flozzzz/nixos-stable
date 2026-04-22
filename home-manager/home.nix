{ config, pkgs, ... }:

{
  imports = [
  ./modules/cursor.nix
  ./modules/fastfetch.nix
  ./modules/kitty.nix
  ./modules/mpv.nix
  ./modules/rofi.nix
  ./modules/btop.nix
  ./modules/hypr.nix
  ./modules/caelestia.nix
  ];

  home.username = "flozz";
  home.homeDirectory = "/home/flozz";

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
