{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./modules/main.nix
    ];

networking.hostName = "nixos"; # Define your hostname.


  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  
  # Select internationalisation properties.
  i18n.defaultLocale = "ru_RU.UTF-8";
  

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.flozz = {
     isNormalUser = true;
     extraGroups = [ "wheel" "audio" "video" "libvirtd"];
     packages = with pkgs; [
       tree
     ];
   };
  

  services.udisks2.enable = true;
  security.polkit.enable = true;
  services.gvfs.enable = true;

#for prismlauncher
  nix.settings = {
    trusted-substituters = [ "https://prismlauncher.cachix.org" ];

    trusted-public-keys = [
      "prismlauncher.cachix.org-1:9/n/FGyABA2jLUVfY+DEp4hKds/rwO+SCOtbOkDzd+c="
    ];
  };

  #on flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11"; # Did you read the comment?

}
