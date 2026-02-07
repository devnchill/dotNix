{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./modules/hardware
      ./modules/boot
      ./modules/network
      ./modules/services
      ./modules/users
      ./modules/desktop
      ./modules/programs
      ./modules/virtualization
    ];

  networking.hostName = "nixosbtw"; # Define your hostname.

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kolkata";

  nixpkgs.config.allowUnfree=true;

  nix.settings.experimental-features=["nix-command" "flakes"];

  environment.sessionVariables = {
	  NIXOS_OZONE_WL = "1";
  };

  system.stateVersion = "25.11"; 

}
