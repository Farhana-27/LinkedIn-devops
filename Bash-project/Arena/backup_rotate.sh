#!/bin/bash

src="$1"
dest="$2"

# Check both arguments were given
if [ -z "$src" ] || [ -z "$dest" ]; then
  echo "Usage: ./backup_rotate.sh <directory_to_back_up> <backup_location>"
  exit 1
fi

# Check the source directory exists
if [ ! -d "$src" ]; then
  echo "Directory $src not found"
  exit 1
fi

# Create the backup location if it doesn't exist
mkdir -p "$dest"

# Create a backup with the date and time in its name
timestamp=$(date '+%Y%m%d_%H%M%S')
backup_file="$dest/backup_$timestamp.tar.gz"
tar -czf "$backup_file" "$src"
echo "Backup created: $backup_file"

# Keep only the 5 newest backups and delete the rest
ls -t "$dest"/backup_*.tar.gz | tail -n +6 | while read -r old
do
  rm "$old"
  echo "Deleted old backup: $old"
done
