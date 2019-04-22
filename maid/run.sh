#!/bin/sh

# Update Calibre if needed
if [ "$UPDATE_CALIBRE" == "False" ]; then
  echo Skipping Calibre update
else
  ./install_calibre.sh
fi

# Run crons
echo Installing jobs from $JOBS_FILE:
cat $JOBS_FILE
supercronic $JOBS_FILE
