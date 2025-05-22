#!/usr/bin/env bash

SESSION=tasks

if tmux has-session -t $SESSION 2>/dev/null; then
  tmux attach -t $SESSION
  exit
fi

tmux new-session -d -s $SESSION -n syncthing "syncthing"
tmux new-window -t $SESSION:1 -n nekoray "nekoray"

tmux attach -t $SESSION
