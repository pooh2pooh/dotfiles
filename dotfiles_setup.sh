#!/bin/bash

dotfiles=(".asoundrc" ".tmux.conf" ".vimrc" ".xbindkeysrc" ".xinitrc" ".xprofile" ".xsettingsd" ".zprofile" ".zshenv" ".zshrc")
dir="${HOME}/dotfiles"

ln -sf ${dir}/.bin ${HOME}/.bin
ln -sf ${dir}/.config/* ${HOME}/.config/
ln -sf ${dir}/.sounds/* ${HOME}/.sounds/

for dotfile in "${dotfiles[@]}";do
  ln -sf "${dir}/${dotfile}" "${HOME}"
done
