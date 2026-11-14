#!/bin/bash

file="$1"

# Check a file was given
if [ -z "$file" ]; then
  echo "Usage: ./parse_config.sh <config_file>"
  exit 1
fi

# Check the file exists
if [ ! -f "$file" ]; then
  echo "File $file not found"
  exit 1
fi

# Read the file one line at a time
while IFS='=' read -r key value
do
  # Skip empty lines and comments
  if [ -z "$key" ] || [[ "$key" == \#* ]]; then
    continue
  fi

  echo "Key: $key, Value: $value"
done < "$file"
