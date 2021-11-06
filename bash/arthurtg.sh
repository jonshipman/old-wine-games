#!/bin/bash

export WINEPREFIX=/Games/prefix/arthurtg 
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

# Wine init
# wine wineboot

# Install Fonts
# winetricks -q corefonts

wine "$WINEPREFIX/drive_c/Program Files/The Learning Company/Arthur's Thinking Games/Park.exe" && /Games/bash/reset_res.sh || /Games/bash/reset_res.sh
