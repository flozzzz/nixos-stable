{ config, pkgs, lib, ... }:

{
    #use-unfree
    nixpkgs.config = {
    allowUnfree = true;
  };
 services.usbmuxd.enable = true;
 programs.firefox.enable = true;
 programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; 
  dedicatedServer.openFirewall = true;
};
 programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
  usbutils
  usbmuxd
  libimobiledevice
  sptlrx
  gvfs
  mtpfs
  jmtpfs
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
  ffmpeg-full
  mpv
  qbittorrent
  lazarus
  polkit_gnome
  obs-studio
  wineWow64Packages.stable
  winetricks
  virtiofsd
  zip
  wl-clipboard
  cliphist
  rofi
 ];

}
