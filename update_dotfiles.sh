#!/bin/bash

DOTFILES_DIR=~/dotfiles/

NEOVIM_DIR=~/.config/nvim

FILES=(
  ~/.config/dunst
  ~/.config/hypr
  ~/.config/Kvantum
  ~/.config/nwg-look
  ~/.config/rofi
  ~/.config/wal
  ~/.config/waybar
  ~/.config/wezterm
  ~/.config/wlogout
  ~/.config/webfetch
  ~/.config/yazi
)

message=""
neovim=false

while getopts "m:n" opt; do
  case $opt in 
    m) message="$OPTARG" ;;
    n) neovim=true ;;
    *) echo "usage: update_dotfiles.sh -m huynya -n"
  esac
done

push() {
  git add .
  git commit -m "$1"
  git push -u origin master
}

for FILE in "${FILES[@]}"; do 
  DEST="$DOTFILES_DIR/"
  cp -r "$FILE" "$DEST"
  echo "copy $FILE into the $DEST"
done

cd $DOTFILES_DIR

echo "updating hyprland dotfiles"

push $1

if [ "$neovim" = true ]; then
  cd $NEOVIM_DIR

  echo "updating neovim dotfiles"

  push "update"
fi

echo "done"
