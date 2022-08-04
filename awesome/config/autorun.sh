#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run lxsession
run mpd
run xscreensaver
run picom
run ~/.fehbg
