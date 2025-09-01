#!/bin/bash
sudo pacman -S --needed - < packages/surface.txt
paru -S --needed $(<packages/aur/surface.txt)
