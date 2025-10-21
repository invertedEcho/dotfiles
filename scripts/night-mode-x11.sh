#!/bin/sh
if pgrep -f 'redshift' >/dev/null; then
  pkill -9 redshift
else
  redshift -O 3000
fi
