#!/bin/sh
# turn off printer when print job is done. Works with node red flow in background
# works together with the TURN_ON_OFF_AUTO_SHUTDOWN macro so i can toggle this in UI

if grep -q "autoonoroff = 1" "/home/pi/klipper_config/saved_variables.cfg"; then
        curl http://192.168.178.34:1880/osram-off > /dev/null 2>&1 &
        sleep 5
        poweroff
else
	exit 1
fi
