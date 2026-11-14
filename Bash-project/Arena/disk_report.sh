#!/bin/bash

dir="$1"
threshold="$2"

# Check both arguments were given
if [ -z "$dir" ] || [ -z "$threshold" ]; then
  echo "Usage: ./disk_report.sh <directory> <threshold_in_KB>"
  exit 1
fi

# Check the directory exists
if [ ! -d "$dir" ]; then
  echo "Directory $dir not found"
  exit 1
fi

# Get the folder's size in KB
usage=$(du -sk "$dir" | awk '{print $1}')

echo "Disk usage of $dir: $usage KB (threshold: $threshold KB)"

# Compare against the threshold
if [ "$usage" -gt "$threshold" ]; then
  echo "ALERT: $dir is over the threshold!"
else
  echo "OK: $dir is within the limit."
fi
