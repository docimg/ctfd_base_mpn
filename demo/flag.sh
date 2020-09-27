#!/bin/sh

echo $FLAG > /flag
chmod 440 /flag
chmod 4555 /readflag

rm -rf /flag.sh