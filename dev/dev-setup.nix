{ ... }:
{
  imports = [
    (import /home/viena/dev/os-contribution/NixOs/nix-security-tracker { }).dev-setup
  ];

  nix-security-tracker-dev-environment = {
    enable = true;
    # The user you run the backend application as, so that you can access the local database
    user = "viena";
    enableDashboard = true;
  };
}
