#!/bin/bash

# Set the path to the configuration file
SCRIPT_DIR="$(dirname "$0")"
CONFIG_FILE="$SCRIPT_DIR/keywords.config"

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <host_file>"
  exit 1
fi

# Input file
HOST_FILE="$1"

# Output directory for filtered HOSTs
OUTPUT_DIR="filtered_hosts"
mkdir -p "$OUTPUT_DIR"

# Ensure the HOST file exists
if [ ! -f "$HOST_FILE" ]; then
  echo "Error: File $HOST_FILE not found."
  exit 1
fi

# Ensure the config file exists
if [ ! -f "$CONFIG_FILE" ]; then
  echo "Error: Config file $CONFIG_FILE not found."
  exit 1
fi

# Read keywords from the config file
mapfile -t KEYWORDS < "$CONFIG_FILE"

# Process each keyword
for KEYWORD in "${KEYWORDS[@]}"; do
  OUTPUT_FILE="$OUTPUT_DIR/$KEYWORD.txt"
  grep -i "$KEYWORD" "$HOST_FILE" > "$OUTPUT_FILE"
  
  # Check if the file is empty and remove it if so
  if [ ! -s "$OUTPUT_FILE" ]; then
    rm "$OUTPUT_FILE"
  else
    echo "Filtered HOSTs for keyword '$KEYWORD' saved to $OUTPUT_FILE."
  fi
done

# Display summary
echo "Filtered HOSTs have been saved to the $OUTPUT_DIR directory."