#!/bin/bash

# Check if the input file is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 input_file output_file"
    exit 1
fi

input_file="$1"
output_file="$2"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: File '$input_file' not found!"
    exit 1
fi

# Read the entire content of the input file into a variable
content=$(<"$input_file")

# Clear or create the output file
> "$output_file"

# Loop through the content to write the incremental lines
for ((i=1; i<=${#content}; i++)); do
    echo "${content:0:i}" >> "$output_file"
done

echo "Output written to '$output_file'"