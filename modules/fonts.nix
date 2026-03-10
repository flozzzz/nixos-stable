{ config, lib, pkgs, ... }:

{

fonts = {
   packages = with pkgs; [
    corefonts
    liberation_ttf
    vista-fonts           
    liberation_ttf   
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
 

}
