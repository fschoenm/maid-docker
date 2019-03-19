#!/bin/sh

# User-specific setup
LOG_FILE=~/.maid/maid.log
touch $LOG_FILE

# Install cron jobs
echo Installing jobs from $JOBS_FILE:
crontab $JOBS_FILE
echo Installed jobs:
crontab -l

# Show logs
tail -f $LOG_FILE
