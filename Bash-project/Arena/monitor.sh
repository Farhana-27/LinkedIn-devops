#!/bin/bash

dir="${1:-.}"
log="$HOME/changes.log"

cd "$dir" || exit
echo "Monitoring $dir - press Ctrl + C to stop"

ls > /tmp/before.txt
stat -f "%N %m %z" * | sort > /tmp/before_stat.txt

while true
do
  sleep 2
  ls > /tmp/after.txt
  stat -f "%N %m %z" * | sort > /tmp/after_stat.txt
  time=$(date '+%Y-%m-%d %H:%M:%S')

  # Created: in the new list but not the old one
  for file in $(comm -13 /tmp/before.txt /tmp/after.txt); do
    echo "$time CREATED: $file" | tee -a "$log"
  done

  # Deleted: in the old list but not the new one
  for file in $(comm -23 /tmp/before.txt /tmp/after.txt); do
    echo "$time DELETED: $file" | tee -a "$log"
  done

  # Modified: details changed, and the file already existed
  for file in $(comm -13 /tmp/before_stat.txt /tmp/after_stat.txt | awk '{print $1}'); do
    if grep -qx "$file" /tmp/before.txt; then
      echo "$time MODIFIED: $file" | tee -a "$log"
    fi
  done

  mv /tmp/after.txt /tmp/before.txt
  mv /tmp/after_stat.txt /tmp/before_stat.txt
done
