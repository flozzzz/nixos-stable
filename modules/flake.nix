{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs = { self, nixpkgs, caelestia-shell, spicetify-nix, ... }: let
    system = "x86_64-linux";
    spicePkgs = spicetify-nix.legacyPackages.${system};
  in
  {
    nixosConfigurations.flozz-nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./configuration.nix  
        ({ pkgs, ... }: {
	nixpkgs.config.allowUnfree = true;
          environment.systemPackages = [
            caelestia-shell.packages.${system}.with-cli
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
