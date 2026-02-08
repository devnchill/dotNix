#!/usr/bin/env bash

# Custom project roots
SEARCH_DIRS=(
  "$HOME/dev/"
)

# Select a directory via fzf
if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(find "${SEARCH_DIRS[@]}" -mindepth 1 -type d | fzf)
fi

# Exit if no selection
[[ -z $selected ]] && exit 0

# Clean name for tmux session
selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

# Start tmux if not running
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  tmux new-session -s "$selected_name" -c "$selected"
  exit 0
fi

# Create session if it doesn't exist
if ! tmux has-session -t="$selected_name" 2>/dev/null; then
  tmux new-session -ds "$selected_name" -c "$selected"
fi

# Switch to it
tmux switch-client -t "$selected_name"
