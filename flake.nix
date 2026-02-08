{
  description = "My NixOS system flake";

  inputs = {
    nixpkgs.url = "github:nixOS/nixpkgs?ref=nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
  let
    hmConfig = {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.backupFileExtension = "backup";
      home-manager.users.viena = ./hosts/nixosbtw/users/viena/home.nix;
      home-manager.extraSpecialArgs = { inherit inputs; };
    };
  in
  {
    nixosConfigurations.nixosbtw =
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/nixosbtw/configuration.nix
          home-manager.nixosModules.home-manager
          hmConfig
        ];
      };
  };
}

