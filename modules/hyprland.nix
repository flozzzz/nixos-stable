{ config, lib, pkgs, ... }:
{

#hyprland
  programs.hyprland = {
   enable = true;
   xwayland.enable = true;
   withUWSM = false;
 };
  environment.sessionVariables = {
   WLR_NO_HARDWARE_CURSORS = "1";
   NIXOS_OZONE_WL = "1";
 };
  hardware = {
   graphics.enable = true;
  };

}
