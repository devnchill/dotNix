{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Viena";
        email = "169875752+devnchill@users.noreply.github.com";
      };
      core.editor = "nvim";
      init.defaultbranch = "main";
      pull.rebase = false;
      commit.gpgsign = true;
      user.signingkey = "F826F032DDDA5560";
      gpg.program = "${pkgs.gnupg}/bin/gpg";
    };
  };
}
