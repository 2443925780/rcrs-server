#!/bin/bash

. functions.sh

processArgs -s $*

# Delete old logs
rm -f $LOGDIR/*.log
sh kill.sh

# startGIS
startKernel --nomenu

echo "Start your agents"
waitFor $LOGDIR/kernel.log "Kernel has shut down" 30

kill $PIDS
