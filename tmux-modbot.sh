#!/bin/bash

SESSION=modbot
WORK_DIR=~/projects/modbot

if tmux has-session -t $SESSION 2>/dev/null; then
  tmux attach -t $SESSION
  exit
fi

cd $WORK_DIR

tmux new-session -ds $SESSION -n zsh
tmux new-window -t $SESSION:1 -n nvim "nvim"
tmux new-window -t $SESSION:2 -n lazygit "lazygit"
tmux new-window -t $SESSION:3 -n server
tmux new-window -t $SESSION:4 -n logs

tmux attach -t $SESSION
