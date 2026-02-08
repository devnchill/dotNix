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

  time.timeZone = "Asia/Kolkata";

  nixpkgs.config.allowUnfree=true;

  nix.settings.experimental-features=["nix-command" "flakes"];

  environment.sessionVariables = {
	  NIXOS_OZONE_WL = "1";
  };

  system.stateVersion = "25.11"; 

}
