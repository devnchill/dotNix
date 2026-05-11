#!/usr/bin/env bash

SEARCH_DIRS=(
  "$HOME/dev/"
)

EXCLUDES=(
  .git
  node_modules
  .venv
  venv
  __pycache__
  .npm
  .cache
  dist
  build
)

find_excludes=()

for dir in "${EXCLUDES[@]}"; do
  find_excludes+=( -name "$dir" -o )
done

unset 'find_excludes[-1]' # remove trailing -o

if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(
    find "${SEARCH_DIRS[@]}" \
      \( "${find_excludes[@]}" \) -prune -o \
      -mindepth 1 -type d -print |
      fzf
  )
fi

[[ -z $selected ]] && exit 0

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  tmux new-session -s "$selected_name" -c "$selected"
  exit 0
fi

if ! tmux has-session -t="$selected_name" 2>/dev/null; then
  tmux new-session -ds "$selected_name" -c "$selected"
fi

tmux switch-client -t "$selected_name"
