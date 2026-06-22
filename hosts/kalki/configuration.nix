_: {
  imports = [
    ./users
    ./hardware-configuration.nix
    ./packages.nix
    ./toggles.nix
  ];

  boot = {
    tmp.cleanOnBoot = true;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  disko.devices = import ../../disko/512.nix { diskDevice = "/dev/nvme0n1"; };

  networking.hostName = "kalki";

  time.timeZone = "Asia/Kolkata";

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  documentation.dev.enable = true;

  system.stateVersion = "25.11";
}
