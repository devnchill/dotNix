{
  imports = [
    ../../modules/nixos
  ];

  dotnix = {
    services = {
      docker.enable = true;
      postgres.enable = true;
      dnscrypt.enable = true;
      sddm.enable = true;
    };
    cache.enable = true;
  };
}
