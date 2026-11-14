#!/bin/bash

# Always run from the folder this script is in (Arena)
cd "$(dirname "$0")" || exit

backup_dir="$HOME/arena_boss_backups"
config_file="settings.conf"

# ---------- Functions ----------

check_disk() {
  df -h /
}

show_uptime() {
  uptime
}

backup_arena() {
  mkdir -p "$backup_dir"
  timestamp=$(date '+%Y%m%d_%H%M%S')
  backup_file="$backup_dir/arena_$timestamp.tar.gz"
  tar -czf "$backup_file" .
  echo "Backup created: $backup_file"

  # Keep only the 3 newest backups
  ls -t "$backup_dir"/arena_*.tar.gz | tail -n +4 | while read -r old
  do
    rm "$old"
    echo "Deleted old backup: $old"
  done
}

parse_config() {
  if [ ! -f "$config_file" ]; then
    echo "$config_file not found"
    return
  fi

  while IFS='=' read -r key value
  do
    if [ -z "$key" ] || [[ "$key" == \#* ]]; then
      continue
    fi
    echo "Key: $key, Value: $value"
  done < "$config_file"
}

# ---------- Menu ----------

while true
do
  echo ""
  echo "===== Boss Battle 3 Menu ====="
  echo "1) Check disk space"
  echo "2) Show system uptime"
  echo "3) Backup Arena (keep last 3)"
  echo "4) Show settings.conf values"
  echo "5) Exit"
  echo "=============================="

  read -p "Choose an option (1-5): " choice
  echo ""

  case $choice in
    1) check_disk ;;
    2) show_uptime ;;
    3) backup_arena ;;
    4) parse_config ;;
    5) echo "Goodbye!"; break ;;
    *) echo "Invalid option, please choose 1-5" ;;
  esac
done
