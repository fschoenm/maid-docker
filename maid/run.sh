#!/bin/sh

# Update Calibre if needed
if [ "$UPDATE_CALIBRE" == "False" ]; then
  echo Skipping Calibre update
else
  ./install_calibre.sh
fi

# User-specific setup
mkdir -p ~/.maid
LOG_FILE=~/.maid/maid.log
touch $LOG_FILE

# Push Maid logs to stdout
tail -f $LOG_FILE &

# Run crons
echo Installing jobs from $JOBS_FILE:
cat $JOBS_FILE
supercronic $JOBS_FILE
