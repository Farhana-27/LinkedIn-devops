#!/bin/bash

if [ -z "$1" ]; then
  echo "No file provided"
else
  lines=$(wc -l < "$1" | tr -d ' ')
  echo "$1 has $lines lines"
fi
