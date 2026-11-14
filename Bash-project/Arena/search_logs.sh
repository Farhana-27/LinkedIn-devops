#!/bin/bash

if [ -z "$1" ]; then
  echo "No search word provided"
else
  echo "Files containing '$1':"
  grep -l "$1" *.log
fi
