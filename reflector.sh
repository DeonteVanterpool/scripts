#!/bin/bash

reflector -c "United States" --verbose --download-timeout 10 --save /etc/pacman.d/mirrorlist
