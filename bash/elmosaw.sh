#!/bin/bash

export WINEPREFIX=/Games/prefix/elmosaw
export WINEARCH=win32
export MESA_GL_VERSION_OVERRIDE=4.5
export MANGOHUD=1

if [ ! -d "$WINEPREFIX" ] ; then
  mkdir -p "$WINEPREFIX"
  echo "using $WINEPREFIX"

  wine wineboot
  # set Windows version and mount cd
  winecfg
  winetricks -q corefonts

  # to install
  wine explorer.exe
else
  sudo chown -R "$USER" "$WINEPREFIX"
fi

if [ "$1" == "tricks" ] ; then
  winetricks ${@: 2}
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

xrandr --output LVDS1 --mode 640x480

wine C:\\windows\\system32\\cmd.exe /c "$WINEPREFIX/drive_c/startup.bat" && /Games/bash/reset_res.sh || /Games/bash/reset_res.sh
