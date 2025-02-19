#!/bin/bash

# Check if URL and file path arguments are provided
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <url_with_FUZZ> <file_path>"
  exit 1
fi

URL_TEMPLATE="$1"
FILE_PATH="$2"

# Check if the file exists
if [ ! -f "$FILE_PATH" ]; then
  echo "Error: File '$FILE_PATH' not found!"
  exit 1
fi

# Read each line from the file and replace FUZZ in the URL
while IFS= read -r line || [ -n "$line" ]; do
  MODIFIED_URL="${URL_TEMPLATE//FUZZ/$line}"
  echo "$MODIFIED_URL"
done < "$FILE_PATH"

