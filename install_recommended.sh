#!/bin/bash

set -e # exit if command fails

sudo pacman -S --needed - < packages/recommended.txt
rustup install stable
./install_paru.sh
paru -S --needed $(<packages/aur/recommended.txt)
./install_essential.sh
