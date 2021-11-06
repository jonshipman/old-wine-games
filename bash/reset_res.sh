#!/bin/bash

GAME_X=${GAME_X:-1280}
GAME_Y=${GAME_Y:-800}

xrandr --output LVDS1 --mode "${GAME_X}x${GAME_Y}"
