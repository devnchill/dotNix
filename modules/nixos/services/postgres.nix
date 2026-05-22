{ pkgs, ... }:
{
  services.postgresql = {
    enable = true;
    ensureDatabases = [ "defaultdb" ];
    package = pkgs.postgresql;
    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  auth-method
      local all       all     trust
      host    all    all    127.0.0.1/32 md5
      host    all       all   ::1/128    md5
    '';
  };
}
