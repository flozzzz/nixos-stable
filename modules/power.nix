{ config, lib, pkgs, ... }:
{

  #battery
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

}
