# This script checks once a minute whether the temperature of the raspberry pi is above 60 degrees and then switches the fan on, otherwise off. The script is not executed if a print job is currently running

response=$(curl -s -X GET "http://localhost:7125/printer/objects/query?print_stats")
state=$(echo $response | grep -o '"state":"[^"]*' | grep -o '[^"]*$')

TEMP_FILE="/sys/class/thermal/thermal_zone0/temp"

CURRENT_TEMP=$(cat $TEMP_FILE)
CURRENT_TEMP=$((CURRENT_TEMP / 1000))

THRESHOLD_TEMP=70

if [ "$state" != "printing" ]; then
    if [ $CURRENT_TEMP -ge $THRESHOLD_TEMP ]; then
        curl -X POST "http://localhost:7125/printer/gcode/script?script=SET_PIN+PIN%3Draspi_fan+VALUE%3D1"
    else
        curl -X POST "http://localhost:7125/printer/gcode/script?script=SET_PIN+PIN%3Draspi_fan+VALUE%3D0"
    fi
fi
