#!/bin/bash
DISPLAY=${DISPLAY:-:0.0}
export DISPLAY=$DISPLAY
java -version
echo "DISPLAY $DISPLAY"
exec java -jar Shuffle.jar run