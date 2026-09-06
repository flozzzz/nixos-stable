{ config, pkgs, lib, pkgs-unstable, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Services
  services.usbmuxd.enable = true;

  # Programs
  programs.firefox.enable = true;
  programs.fish.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # System packages
  environment.systemPackages = with pkgs; [
    # Core utilities
    git
    wget
    unzip
    zip
    rsync
    ncdu
    usbutils
    kdePackages.kio
    kdePackages.kio-fuse
    kdePackages.kio-extras
    unrar

    # Device / phone / filesystem helpers
    usbmuxd
    libimobiledevice
    gvfs
    mtpfs
    jmtpfs
    virtiofsd

    # Development / programming
    python3
    gcc
    neovim
    vim
    lazarus
    openjdk25
    openjdk21
    # Terminal / TUI / shell tools
    btop
    fastfetch
    cava
    pipes-rs
    sl
    nyancat
    tty-clock
    
    # Desktop / Wayland / shell
    kitty
    rofi
    wl-clipboard
    cliphist
    wayland-protocols
    kdePackages.dolphin
    polkit_gnome
    kdePackages.qtsvg
    kdePackages.breeze
    qt6Packages.qt6ct
    
    # Media / internet / apps
    telegram-desktop
    libreoffice-qt
    ffmpeg-full
    mpv
    qbittorrent
    obs-studio
    kdePackages.gwenview
    scanmem
    krita
    obsidian    
    bottles
    inkscape    

    # Wine / Windows compatibility
    wineWow64Packages.stable
    winetricks
  ] ++ [
    pkgs-unstable.antigravity-cli
  ];
}
