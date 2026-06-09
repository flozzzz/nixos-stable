{
  description = "A very basic flake";
  
  inputs = {
  nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

  caelestia-shell = {
    url = "github:caelestia-dots/shell";
    inputs.nixpkgs.follows = "nixpkgs-unstable";
    inputs.quickshell.follows = "quickshell";
  };

  spicetify-nix = {
    url = "github:Gerg-L/spicetify-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  quickshell = {
    url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
    inputs.nixpkgs.follows = "nixpkgs-unstable";
  };
  
  home-manager = {
    url = "github:nix-community/home-manager/release-26.05";
    inputs.nixpkgs.follows = "nixpkgs";
  };

};
 
  outputs = { self, nixpkgs, nixpkgs-unstable, quickshell, home-manager, caelestia-shell, spicetify-nix, ... }:
  let
    system = "x86_64-linux";
    spicePkgs = spicetify-nix.legacyPackages.${system};
    qsPkg = quickshell.packages.${system}.default;
  in {
    nixosConfigurations.flozz-nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager

        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
	  home-manager.users.flozz = import ./home-manager/home.nix;
        }

        ({ pkgs, ... }: {
          nixpkgs.config.allowUnfree = true;
          environment.systemPackages = [
            caelestia-shell.packages.${system}.with-cli
	    qsPkg
          ];

          imports = [
            spicetify-nix.nixosModules.spicetify
          ];

          programs.spicetify = {
            enable = true;
            enabledExtensions = with spicePkgs.extensions; [
              adblockify
              hidePodcasts
              fullScreen
              beautifulLyrics
              shuffle
            ];
            theme = spicePkgs.themes.catppuccin;
            colorScheme = "mocha";
          };
        })
      ];
    };
  };
}
