{ config, pkgs, lib, ... }:
{

programs.virt-manager.enable = true;
users.groups.libvirtd.members = ["flozz"];
virtualisation.spiceUSBRedirection.enable = true;  
virtualisation.libvirtd = {
  enable = true;
  qemu = {
    package = pkgs.qemu_kvm;
    runAsRoot = true;
    vhostUserPackages = [ pkgs.virtiofsd ];
  };
};

}
