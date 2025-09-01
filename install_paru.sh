#!/bin/bash

set -e # exit immediately if a command fails

cd ..
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru
