# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
#nftables
networking.nftables.enable = true;
#boot-grub
boot.loader = {
  efi = {
    canTouchEfiVariables = true;
  };

  grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
    useOSProber = true;
  };
};

  #use-unfree
  nixpkgs.config = {
    allowUnfree = true;
  };


  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.supportedFilesystems = [ "ntfs" ];
  networking.hostName = "flozz-nixos"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

#auto-mount
services.udisks2.enable = true;
security.polkit.enable = true;
services.gvfs.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  #on flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  
  #battery
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
  
  # Select internationalisation properties.
  i18n.defaultLocale = "ru_RU.UTF-8";
  
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  services.xserver = {
   enable = true;
   };
#sddm
   services.displayManager.sddm = {
     enable = true;
};

#hyprland
  programs.hyprland = {
   enable = true;
   xwayland.enable = true;
 };
  environment.sessionVariables = {
   WLR_NO_HARDWARE_CURSORS = "1";
   NIXOS_OZONE_WL = "1";
 };
  hardware = {
   graphics.enable = true;
  };
  # Configure keymap in X11
  services.xserver.xkb.layout = "us,ru";
  services.xserver.xkb.options = "grp:alt_shift+toggle";
  # bluetooth
  hardware.bluetooth = {
  enable = true;
  powerOnBoot = true;
  settings = {
    General = {
      # Shows battery charge of connected devices on supported
      # Bluetooth adapters. Defaults to 'false'.
      Experimental = true;
      # When enabled other devices can connect faster to us, however
      # the tradeoff is increased power consumption. Defaults to
      # 'false'.
      FastConnectable = true;
    };
    Policy = {
      # Enable all controllers when they are found. This includes
      # adapters present on start as well as adapters that are plugged
      # in later on. Defaults to 'true'.
      AutoEnable = true;
    };
  };
};

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
   services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.flozz = {
     isNormalUser = true;
     extraGroups = [ "wheel" "audio" "video"]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       tree
     ];
   };

 programs.firefox.enable = true;
 programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
};
 programs.fish.enable = true;
  environment.systemPackages = with pkgs; [
  vim
  sl
  wget
  python3
  neovim
  btop
  fastfetch
  cava
  pipes-rs
  kitty
  git
  unzip
  nyancat
  tty-clock
  ncdu
  wayland-protocols
  quickshell
  kdePackages.dolphin
  rsync
  telegram-desktop
  libreoffice-qt
  pkgs.ffmpeg-full
  pkgs.mpv
  pkgs.qbittorrent
];
 
#fonts
fonts = {
   packages = with pkgs; [
    corefonts
    liberation_ttf
    vista-fonts             # Calibri, Cambria, Consolas, Segoe UI (частично)
    liberation_ttf         # хорошая замена виндовым
    dejavu_fonts
    inter
    roboto
    noto-fonts
    noto-fonts-color-emoji
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    source-han-sans
    source-han-serif
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.hack
    nerd-fonts.symbols-only
  ];

  fontconfig = {
    defaultFonts = {
      serif = [
        "Noto Serif"
        "Noto Serif CJK JP"
      ];
      sansSerif = [
        "Inter"
        "Noto Sans"
        "Noto Sans CJK JP"
      ];
      monospace = [
        "JetBrainsMono Nerd Font"
        "Symbols Nerd Font"
      ];
      emoji = [
        "Noto Color Emoji"
      ];
    };
  };
};
 

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?

}
