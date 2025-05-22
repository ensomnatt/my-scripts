#!/usr/bin/env bash

SESSION=nixos
NIXOS_DIR=/home/ensomnatt/nixos

if tmux has-session -t $SESSION 2>/dev/null; then
  tmux attach -t $SESSION
  exit
fi

cd $NIXOS_DIR

tmux new-session -ds $SESSION -n zsh
tmux new-window -t $SESSION:1 -n home.nix "nvim hosts/main/home.nix"
tmux new-window -t $SESSION:2 -n modules "nvim modules"
tmux new-window -t $SESSION:3 -n configuration.nix "nvim hosts/main/configuration.nix"
tmux new-window -t $SESSION:4 -n flake.nix "nvim flake.nix"
tmux new-window -t $SESSION:5 -n scripts "nvim ~/.local/bin"

tmux attach -t $SESSION
