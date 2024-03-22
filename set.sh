#!/bin/sh
set -e

if command -v nvim >/dev/null 2>&1 && [ ! -e ~/.config/nvim/ ]; then
  pip3 install --user pynvim neovim-remote
fi

if command -v gh >/dev/null 2>&1 && [ ! -e ~/.config/gh/ ]; then
  gh extension install github/gh-copilot
  gh extension install dlvhdr/gh-dash
fi

echo "Finished!"
