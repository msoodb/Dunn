#!/bin/bash

# Script Name: phase_zero_assault.sh
# Description: Automated reconnaissance and vulnerability scanning script.
# Author: [Your Name]
# Usage: ./phase_zero_assault.sh

# Help section
function help() {
    echo "Usage: phase_zero_assault.sh"
    echo "Description: This script performs automated tasks including bypassing 403 responses, searching for Broken Link Hijacking (BLH), subdomain takeovers, XSS vulnerabilities, and scanning for known vulnerabilities, CVEs, and exposures."
    echo "Ensure you have all required tools installed before running the script."
}

# Check if help is requested
if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    help
    exit 0
fi

# Create the output directory
OUTPUT_DIR="phase_zero_assault"
echo "Creating output directory: $OUTPUT_DIR"
mkdir -p $OUTPUT_DIR

# 403 Bypass
echo "Starting 403 Bypass scans..."
for LINE in $(cat 403-hosts.txt); do
    echo "Processing $LINE"
    bypass-403.sh "$LINE" | tee -a "$OUTPUT_DIR/403-hosts.txt.result"
done

# Broken Link Hijacking (BLH)
echo "Scanning for Broken Link Hijacking (BLH)..."
socialhunter -f hosts.txt | tee "$OUTPUT_DIR/socialhunter.hosts.txt"
socialhunter -f urls.txt | tee "$OUTPUT_DIR/socialhunter.urls.txt"

# Subdomain Takeovers
echo "Scanning for Subdomain Takeovers..."
nuclei -l hosts.txt -t ~/nuclei-templates/http/takeovers/ -o "$OUTPUT_DIR/nuclei-takeovers-hosts.txt"
subzy run --targets hosts.txt | tee "$OUTPUT_DIR/subzy.hosts.txt"

# XSS - (Commented out examples, uncomment as needed)
# echo "Scanning for XSS vulnerabilities..."
# # Method I
# grep "?" urls.txt | kxss | tee urls-kxss.txt
# cat urls-kxss.txt | grep \" | awk '{print $2}' > urls-kxss-vuln.txt
# dalfox file urls-kxss-vuln.txt -o dalfox.txt

# # Method II
# grep -E "(search|query|id|lang|page)=" urls-params.txt > urls-params-potential-xss.txt
# urls-test-payload.py urls-params-potential-xss.txt
# nuclei -l urls-params-potential-xss.txt -tags xss
# cat urls-params-potential-xss.txt | dalfox pipe -b localhost

# # Method III
# cat paramspider/target.com.txt | kxss | tee paramspider/target.com.txt.kxss

# Vulnerabilities, CVEs, Exposures
echo "Scanning for vulnerabilities, CVEs, and exposures..."
nuclei -l scopes.txt \
    -t ~/nuclei-templates/http/vulnerabilities/ \
    -t ~/nuclei-templates/http/cves/ \
    -t ~/nuclei-templates/http/exposures/ \
    -t ~/nuclei-templates/technologies/ \
    -o "$OUTPUT_DIR/nuclei-scopes.txt"

echo "Phase Zero Assault completed. Results saved in $OUTPUT_DIR."
