#!/bin/bash

figlet CASTLE
# Script Name: castle_assault.sh
# Description: Automated reconnaissance and vulnerability scanning script.
# Author: msoodb
# Usage: castle_assault.sh

# Help section
function help() {
    echo "Usage: castle_assault.sh"
    echo "Description: This script performs automated tasks including bypassing 403 responses, searching for Broken Link Hijacking (BLH), subdomain takeovers, and scanning for known vulnerabilities, CVEs, and exposures."
    echo "Ensure you have all required tools installed before running the script."
}

# Check if help is requested
if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    help
    exit 0
fi

# Create the output directory
OUTPUT_DIR="castle_assault"
echo "Creating output directory: $OUTPUT_DIR"
mkdir -p $OUTPUT_DIR


##############################################################################################################################

# Subdomain Takeovers
echo "Scanning for Subdomain Takeovers..."
nuclei -l httpx.txt -t ~/nuclei-templates/http/takeovers/ -o "$OUTPUT_DIR/nuclei-takeovers-httpx.txt"
subzy run --targets httpx.txt | tee "$OUTPUT_DIR/subzy-httpx.txt"
cat "$OUTPUT_DIR/subzy-httpx.txt" | grep -v "NOT VULNERABLE" | grep -v "HTTP ERROR" | tee "$OUTPUT_DIR/subzy-httpx-vuln.txt"
echo "Scanning for Subdomain Takeovers...done!"


# 403 Bypass
echo "Starting 403 Bypass scans..."
for LINE in $(cat httpx-403.txt); do
    bypass-403.sh "$LINE" | tee -a "$OUTPUT_DIR/httpx-403-result.txt"
done
cat "$OUTPUT_DIR/httpx-403-result.txt" | grep 200 > "$OUTPUT_DIR/httpx-403-result-200.txt"
echo "Starting 403 Bypass scans...done!"

# Broken Link Hijacking (BLH)
echo "Scanning for Broken Link Hijacking (BLH)..."
socialhunter -f httpx.txt -w 10 | tee "$OUTPUT_DIR/socialhunter.httpx.txt"
echo "Scanning for Broken Link Hijacking (BLH)...done!"

echo "Phase Zero Assault completed. Results saved in $OUTPUT_DIR."
