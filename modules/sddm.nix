
{ config, pkgs, lib, ... }:


let
  hyprlandKathTheme = pkgs.stdenv.mkDerivation {
    name = "sddm-hyprland-kath";
    src = "${pkgs.sddm-astronaut}";
    buildInputs = [ pkgs.gnumake pkgs.coreutils ]; # необязательно, но безопасно
    installPhase = ''
      mkdir -p $out/share/sddm/themes/sddm-hyprland-kath
      cp -r ${pkgs.sddm-astronaut}/share/sddm/themes/sddm-astronaut-theme/* \
            $out/share/sddm/themes/sddm-hyprland-kath/
      substituteInPlace $out/share/sddm/themes/sddm-hyprland-kath/metadata.desktop \
        --replace "ConfigFile=Themes/astronaut.conf" "ConfigFile=Themes/hyprland_kath.conf"
      substituteInPlace $out/share/sddm/themes/sddm-hyprland-kath/metadata.desktop \
        --replace "Theme-Id=sddm-astronaut-theme" "Theme-Id=sddm-hyprland-kath"
      chmod -R a+r $out/share/sddm/themes/sddm-hyprland-kath
    '';
  };
in
{
services.displayManager.sddm = {
  enable = true;
  theme = "sddm-hyprland-kath";
  extraPackages = [
      hyprlandKathTheme
      pkgs.qt6.qtmultimedia
      pkgs.qt6.qtbase
      pkgs.qt6.qtdeclarative
    ];
};


 environment.systemPackages = with pkgs; [
    hyprlandKathTheme
 ];
}
