#!/bin/bash

export WINEPREFIX=/Games/prefix/elmosworld
export WINEARCH=win32
export MESA_GL_VERSION_OVERRIDE=4.5
export MANGOHUD=1

mkdir -p "$WINEPREFIX"
echo "using $WINEPREFIX"
sudo chown -R "$USER" "$WINEPREFIX"

if [ "$1" == "tricks" ] ; then
  winetricks
  exit 0
fi

if [ "$1" == "cfg" ] ; then
  winecfg
  exit 0
fi

if [ "$1" == "explore" ] ; then
  wine explorer.exe
  exit 0
fi

wine "$WINEPREFIX/drive_c/Program Files/Sesame Street/Sesame Street - Elmo's World/Elmo's World.exe" && /Games/bash/reset_res.sh || /Games/bash/reset_res.sh
