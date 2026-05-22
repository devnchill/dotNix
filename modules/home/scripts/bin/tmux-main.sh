#!/usr/bin/env bash
SESSION="main"

tmux has-session -t $SESSION 2>/dev/null

if [ $? != 0 ]; then
  tmux new-session -s $SESSION
else
  tmux attach-session -t $SESSION
fi
