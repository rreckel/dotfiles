#! /bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

feh --bg-scale $HOME/.xmonad/wall.jpg &
conky &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &

