{
  sops = {
    age.keyFile = "/var/lib/sops-nix/key.txt";
    defaultSopsFile = ../../secrets/ssh.yaml;

    secrets.github_private = {
      owner = "viena";
      path = "/home/viena/.ssh/github";
      mode = "0600";
    };

    secrets.github_public = {
      owner = "viena";
      path = "/home/viena/.ssh/github.pub";
      mode = "0644";
    };
  };
}
