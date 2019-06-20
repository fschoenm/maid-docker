#!/bin/sh

# Run crons
echo Installing jobs from $JOBS_FILE:
cat $JOBS_FILE
supercronic $JOBS_FILE
