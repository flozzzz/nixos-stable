{ config, lib, pkgs, ... }:

{
 #nftables-and-firewall
 networking.firewall.enable = true;
 networking.nftables.enable = true;

 #homelab-domains
 networking.hosts = {
  "192.168.0.15" = [ "npm.home" "jellyfin.home" "nextcloud.home" "adguard.home" "portainer.home" ];
};
 
 #vless
 programs.throne.enable = true;
 programs.throne.tunMode.enable = true;
 #network-manager
 networking.networkmanager.enable = true;
}
