#!/bin/sh
set -e
SCRIPT_DIR=$(cd $(dirname $0); pwd)

if [ -e $(which nvim) ] && [ ! -e ~/.config/nvim/ ]; then
  pip3 install --user pynvim neovim-remote
  ln -Fis $HOME/.cache/nvim/dein/repos/github.com/whatyouhide/vim-gotham/colors $HOME/.config/nvim/colors
fi

echo "Finished!"
