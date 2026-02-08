{config,pkgs,...}:

{
  programs.git = {
      enable = true;
      settings = {
      user={
          name="Viena";
          email = "169875752+devnchill@users.noreply.github.com";
      };
      core.editor="nvim";
      init.defaultbranch="main";
      pull.rebase=false;
      };
  };
}
