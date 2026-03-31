{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
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
  wine
 ];

}
