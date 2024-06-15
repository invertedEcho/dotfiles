{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, ...}: {
    nixosConfigurations = {
      home-pc = nixpkgs.lib.nixosSystem {
	system = "x86-64-linux";
	modules = [
	  ./configuration.nix
	  ./hardware-configuration.nix

	  home-manager.nixosModules.home-manager
	  {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.users.echo = import ./modules/home.nix;
	    home-manager.backupFileExtension = ".bak";
	  }
	];
      };
    };
  };
 #    let
 #      system = "x86_64-linux";
 #    in
 #    {
 #      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
	# inherit system;
 #        specialArgs = { inherit inputs; };
 #        modules = [
 #          ./configuration.nix
 #          ./hardware-configuration.nix
 #        ];
 #      };
	#
 #    };
}
