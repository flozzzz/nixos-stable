{ config, lib, pkgs, ... }:
{
   services.xserver = {
    enable = true;
   };

  # Configure keymap in X11
  services.xserver.xkb.layout = "us,ru";
  services.xserver.xkb.options = "grp:alt_shift+toggle";
  
}
