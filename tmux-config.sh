#!/bin/bash

SESSION=config

if tmux has-session -t $SESSION 2>/dev/null; then
  tmux attach -t $SESSION
  exit
fi

tmux new-session -d -s $SESSION -n zsh
tmux new-window -t $SESSION:1 -n hyprland "cd ~/.config/hypr && nvim"
tmux new-window -t $SESSION:2 -n waybar "cd ~/.config/waybar && nvim"
tmux new-window -t $SESSION:3 -n tmux "nvim ~/.tmux.conf"
tmux new-window -t $SESSION:4 -n zsh-config "nvim ~/.zshrc"
tmux new-window -t $SESSION:5 -n nvim  "cd ~/.config/nvim && nvim"
tmux new-window -t $SESSION:6 -n wezterm "cd ~/.config/wezterm && nvim"
tmux new-window -t $SESSION:7 -n scripts "cd ~/bin && nvim"
tmux new-window -t $SESSION:8 -n dunst "cd ~/.config/dunst && nvim dunstrc"
tmux new-window -t $SESSION:9 -n matugen "cd ~/.config/matugen && nvim"
tmux new-window -t $SESSION:10 -n rofi "cd ~/.config/rofi && nvim"

tmux attach -t $SESSION
