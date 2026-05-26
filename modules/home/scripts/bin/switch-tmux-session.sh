#!/usr/bin/env bash
echo "Script started at $(date)" >>/tmp/tmux-switch-session.log
env >>/tmp/tmux-switch-session.log

sessions=$(tmux list-sessions -F "#{session_name}")
selected=$(echo "$sessions" | fzf --prompt="Select tmux session: ")

if [[ -n $selected ]]; then
  tmux switch-client -t "$selected"
fi
