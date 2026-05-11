{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    shell = "${pkgs.fish}/bin/fish";
    terminal = "tmux-256color";
    historyLimit = 100000;

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      {
        plugin = gruvbox;
        extraConfig = ''
          set -g @tmux-gruvbox 'dark'
        '';
      }
    ];

    extraConfig = ''
      set-window-option -g mode-keys vi

      bind-key -T copy-mode-vi 'v' send -X begin-selection
      bind-key -T copy-mode-vi 'y' send -X copy-selection

      set -ga terminal-overrides ",xterm-256color:Tc"
      set -g focus-events on

      bind r source-file ~/.config/tmux/tmux.conf \; display-message "Tmux config reloaded!"

      bind-key K run-shell '
        current=$(tmux display-message -p "#S");
        if [ "$current" != "main" ]; then
          tmux switch-client -t main \; kill-session -t "$current";
        fi
      '

      bind-key -r D run-shell "tmux-sessionizer ~/dev/learning/DSA"
      bind-key -r f run-shell "tmux neww tmux-sessionizer"
      bind-key -r s new-window "switch-tmux-session"
      bind-key -r m switch-client -t main

    '';
  };
}
