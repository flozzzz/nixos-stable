{ ... }:

{
  virtualisation.docker.enable = true;

  boot.binfmt = {
    emulatedSystems = [ "aarch64-linux" ];
    preferStaticEmulators = true;
  };
}
