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
    {
      nixpkgs,
      home-manager,

      spicetify-nix,
      pre-commit-hooks,
      ...
    }:
    let
      system = "x86_64-linux";
      overlays = [ (import ./overlay) ];
      pkgs = import nixpkgs { inherit system overlays; };

      sharedConfig = ./config;

      hmConfig = {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "backup";
          users.viena = ./hosts/kalki/users/viena/home.nix;
          extraSpecialArgs = {
            inherit spicetify-nix;
            inherit sharedConfig;
          };
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
      nixosConfigurations.kalki = nixpkgs.lib.nixosSystem {
        modules = [
          { nixpkgs.overlays = overlays; }

          ./hosts/kalki/configuration.nix
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
