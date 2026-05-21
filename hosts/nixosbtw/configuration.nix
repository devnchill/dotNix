_: {
  imports = [
    ../../modules/os
  ];

  time.timeZone = "Asia/Kolkata";

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.localBinInPath = true;
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  system.stateVersion = "25.11";
}
