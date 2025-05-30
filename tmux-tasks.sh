#!/usr/bin/env bash

SESSION=tasks

if tmux has-session -t $SESSION 2>/dev/null; then
  tmux attach -t $SESSION
  exit
fi

tmux new-session -d -s $SESSION -n syncthing "syncthing"

tmux attach -t $SESSION
