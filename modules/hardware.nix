{ config, pkgs, lib, ... }:

{
  hardware.enableRedistributableFirmware = true;
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  hardware.graphics = {
    enable = true;
    enable32Bit = true; 
    extraPackages = with pkgs; [
      intel-media-driver
    ];
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };

  services.thermald.enable = true;

  services.power-profiles-daemon.enable = true;

  services.tlp.enable = false;
}
