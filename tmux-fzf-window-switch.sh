#!/bin/bash
tmux list-windows -F '#I: #W' \
  | fzf --prompt="Windows > " \
  | cut -d: -f1 \
  | xargs -r tmux select-window -t
