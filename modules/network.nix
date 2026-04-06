{ config, lib, pkgs, ... }:

{
 #nftables-and-firewall
 networking.firewall.enable = true;
 networking.nftables.enable = true;
 
 #vless
 services.v2raya.enable = true;
 services.v2raya.cliPackage = pkgs.xray;
 networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];

 #network-manager
 networking.networkmanager.enable = true;
}
