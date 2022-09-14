#!/bin/sh
# turn off printer when print job is done. Works with node red flow in background

curl http://192.168.178.34:1880/osram-off > /dev/null 2>&1 &
sleep 5
poweroff
