{
  imports = [
    ../../modules/nixos
  ];

  dotnix = {
    services = {
      docker = {
        enable = true;
        users = [ "viena" ];
      };
      postgres.enable = true;
      dnscrypt.enable = true;
      sddm.enable = true;
    };
    cache.enable = true;
  };
}
