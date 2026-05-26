{ lib, config, ... }:
let
  cfg = config.dotnix.services.dnscrypt;
in
{
  options.dotnix.services.dnscrypt.enable = lib.mkEnableOption "dnscrypt-proxy";

  config = lib.mkIf cfg.enable {
    services.resolved.enable = false;

    services.dnscrypt-proxy = {
      enable = true;
      settings = {
        ipv6_servers = true;
        require_dnssec = true;
        query_log.file = "/var/log/dnscrypt-proxy/query.log";
        sources = {
          public-resolvers = {
            urls = [
              "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
              "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
            ];
            cache_file = "/var/cache/dnscrypt-proxy/public-resolvers.md";
            minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
          };
        };
      };
    };
  };
}
