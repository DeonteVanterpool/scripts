#!/bin/bash

export DISPLAY=:0

# Try default location
XAUTHORITY_FILE="$HOME/.Xauthority"

# Fallback to runtime location if it exists
RUNTIME_AUTH=$(find /run/user/$(id -u) -name Xauthority 2>/dev/null | head -n 1)
if [ -f "$RUNTIME_AUTH" ]; then
  export XAUTHORITY="$RUNTIME_AUTH"
else
  export XAUTHORITY="$XAUTHORITY_FILE"
fi

# List of known mappable devices
DEVICES=(
  "IPTSD Virtual Touchscreen 045E:0C1B"
  "IPTSD Virtual Stylus 045E:0C1B Pen (0)"
  "IPTSD Virtual Stylus 045E:0C1B Eraser (0)"
)

while true; do
  for name in "${DEVICES[@]}"; do
    if xinput list --name-only | grep -Fxq "$name"; then
      if xinput list-props "$name" 2>/dev/null | grep -q "Coordinate Transformation Matrix"; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Mapping $name to eDP-1"
        xinput map-to-output "$name" eDP-1
      else
        echo "Skipping $name (not mappable)"
      fi
    fi
  done
  sleep 5
done
