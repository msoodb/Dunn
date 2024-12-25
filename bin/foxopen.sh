#!/bin/bash

# Check if a file name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <file_name>"
  exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
  echo "Error: File '$1' not found."
  exit 1
fi

# Open all lines in Firefox
cat "$1"
firefox --new-window $(cat "$1")
