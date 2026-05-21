_: {
  networking = {
    hostName = "nixosbtw";
    networkmanager = {
      insertNameservers = [
        "127.0.0.1"
        ":1"
      ];
      enable = true;
      dns = "none";
    };
  };
}
