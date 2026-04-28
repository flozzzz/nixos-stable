{ config, lib, pkgs, ... }:

{
 #nftables-and-firewall
 networking.firewall.enable = true;
 networking.nftables.enable = true;
 
 #vless
 programs.throne.enable = true;
 programs.throne.tunMode.enable = true;
 #network-manager
 networking.networkmanager.enable = true;
}
