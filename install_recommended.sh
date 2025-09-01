#!/bin/bash

set -e # exit if command fails

sudo pacman -S - < packages/recommended.txt
rustup install stable
paru -S --needed $(<packages/aur/recommended.txt)
./install_essential.sh
