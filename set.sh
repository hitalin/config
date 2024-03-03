#!/bin/sh
set -e

if command -v nvim >/dev/null 2>&1 && [ ! -e ~/.config/nvim/ ]; then
  pip3 install --user pynvim neovim-remote
fi

echo "Finished!"
