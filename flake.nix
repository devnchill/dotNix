{
  description = "My NixOS system flake";

  inputs = {
    nixpkgs.url = "github:nixOS/nixpkgs?ref=nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      pre-commit-hooks,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      hmConfig = {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "backup";
          users.viena = ./hosts/nixosbtw/users/viena/home.nix;
          extraSpecialArgs = { inherit inputs; };
        };
      };

      preCommitCheck = pre-commit-hooks.lib.${system}.run {
        src = ./.;
        hooks = {
          nixfmt.enable = true;
          statix.enable = true;
          deadnix.enable = true;
        };
      };
    in
    {
      nixosConfigurations.nixosbtw = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/nixosbtw/configuration.nix
          home-manager.nixosModules.home-manager
          hmConfig
        ];
      };

      checks.${system}.pre-commit-check = preCommitCheck;
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt-tree;

      devShells.${system}.default = import ./devshell.nix {
        inherit pkgs;
        inherit (preCommitCheck) shellHook;
      };
    };
}
