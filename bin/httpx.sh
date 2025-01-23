#!/bin/bash

# ----------------------------------
#   httpx Enumeration
# ----------------------------------

SUBDOMAINS=$1
OUTPUT_DIR="status_httpx"
mkdir $OUTPUT_DIR 

# httpx
httpx -l $SUBDOMAINS -sc -ip -probe -title -nc -o httpx-full.txt


cat httpx-full.txt | awk '{print $1}' > httpx.txt


grep "\[SUCCESS\] \[2..\]" httpx-full.txt | awk '{print $1}' > "$OUTPUT_DIR/httpx-2xx.txt"
grep "\[SUCCESS\] \[3..\]" httpx-full.txt | awk '{print $1}' > "$OUTPUT_DIR/httpx-3xx.txt"
grep "\[SUCCESS\] \[403\]" httpx-full.txt | awk '{print $1}' > "$OUTPUT_DIR/httpx-403.txt"
grep "\[SUCCESS\] \[404\]" httpx-full.txt | awk '{print $1}' > "$OUTPUT_DIR/httpx-404.txt"
grep "\[SUCCESS\] \[5..\]" httpx-full.txt | awk '{print $1}' > "$OUTPUT_DIR/httpx-5xx.txt"