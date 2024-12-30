#!/bin/bash

# ----------------------------------
#   JS Download
# ----------------------------------

URL_FILE=$1
OUTPUT_DIR=js/
LOG_FILE="failed_$1..log"

mkdir -p "$OUTPUT_DIR"
> "$LOG_FILE"

while IFS= read -r URL; do
    FILENAME=$(basename "$URL")
    echo "Downloading: $URL"
    
    curl -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36" \
         --referer "https://example.com" \
         --retry 3 \
         --max-time 15 \
         --output "$OUTPUT_DIR/$FILENAME" "$URL" || {
        echo "Failed: $URL" >> "$LOG_FILE"
    }
done < "$URL_FILE"

echo "Download complete. Check $LOG_FILE for failed URLs."
