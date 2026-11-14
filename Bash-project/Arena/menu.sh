#!/bin/bash

while true
do
  echo ""
  echo "===== System Menu ====="
  echo "1) Check disk space"
  echo "2) Show system uptime"
  echo "3) List logged-in users"
  echo "4) Show date and time"
  echo "5) Show memory usage"
  echo "6) Show top 5 processes by CPU"
  echo "7) Show my IP address"
  echo "8) Exit"
  echo "======================="

  read -p "Choose an option (1-8): " choice
  echo ""

  case $choice in
    1) df -h / ;;
    2) uptime ;;
    3) who ;;
    4) date ;;
    5) top -l 1 | grep PhysMem ;;
    6) ps -Ao pid,pcpu,comm -r | head -6 ;;
    7) ipconfig getifaddr en0 ;;
    8) echo "Goodbye!"; break ;;
    *) echo "Invalid option, please choose 1-8" ;;
  esac
done
