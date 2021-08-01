#!/bin/sh
set -e
SCRIPT_DIR=$(cd $(dirname $0); pwd)

if [ -e /mnt/c/WINDOWS/System32/wsl.exe ]; then
  echo "Let's create hard link '/etc/wsl.conf' => '~/config/wsl.conf"
  sudo ln $SCRIPT_DIR/wsl.conf /etc/wsl.conf
fi

echo "Finished!"
