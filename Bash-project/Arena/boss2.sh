#!/bin/bash

# 1. Create the directory
mkdir -p Arena_Boss

# 2 & 3. Create 5 files, each with 10-20 random lines
for i in {1..5}
do
  lines=$((RANDOM % 11 + 10))
  > Arena_Boss/file$i.txt

  for j in $(seq 1 $lines)
  do
    if [ $((RANDOM % 20)) -eq 0 ]; then
      echo "Victory" >> Arena_Boss/file$i.txt
    else
      echo "Battle line $j" >> Arena_Boss/file$i.txt
    fi
  done
done

# 4. Sort the files by size and display them
echo "Files sorted by size (smallest to largest):"
ls -lSr Arena_Boss/*.txt

# 5. Move any file containing 'Victory' to Victory_Archive
mkdir -p Victory_Archive
for file in Arena_Boss/*.txt
do
  if grep -q "Victory" "$file"; then
    mv "$file" Victory_Archive/
    echo "Victory found in $(basename "$file") - moved to Victory_Archive"
  fi
done
