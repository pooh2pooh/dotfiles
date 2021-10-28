#!/bin/bash

dotfiles=(".asoundrc" ".tmux.conf" ".vimrc" ".xbindkeysrc" ".xinitrc" ".xprofile" ".xsettingsd" ".zprofile" ".zshenv" ".zshrc" "bin" ".config/dunst" ".config/fusuma" ".config/i3" ".config/kitty" ".config/polybar" ".config/picom.conf" ".icons/custom-icons" ".sounds")
dir="${HOME}/dotfiles"

for dotfile in "${dotfiles[@]}";do
 if [[ "${dotfile}" == *".config"* ]];then
  ln -sf "${dir}/${dotfile}" "${HOME}/.config"
 elif [[ "${dotfile}" == *".icons"* ]];then
  ln -sf "${dir}/${dotfile}" "${HOME}/.icons"
 else
  ln -sf "${dir}/${dotfile}" "${HOME}"
 fi
done
