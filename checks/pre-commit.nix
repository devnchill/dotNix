{ pre-commit-hooks, system }:
pre-commit-hooks.lib.${system}.run {
  src = ./.;
  hooks = {
    nixfmt.enable = true;
    statix.enable = true;
    deadnix.enable = true;
  };
}
