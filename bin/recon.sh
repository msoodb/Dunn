#!/bin/bash

figlet Reconnaissance
# Script Name: recon.sh
# Description: Automated reconnaissance script.
# Author: msoodb
# Usage: recon.sh

# Default variables
SCOPES=""
OUT_OF_FSCOPES=""
LEVEL=0

# Help function
function show_help {
    echo "Usage: $0 [options]"
    echo
    echo "Options:"
    echo "  -s FILE   File containing scopes (domains, URLs, and wildcards in scope). Required for Level 1."
    echo "  -oos FILE File containing out of scopes (optional). Used only in Level 1."
    echo "  -l LEVEL  Level of execution (1 or 2 or 3)."
    echo "  -h        Show this help message and exit."
    echo
    echo "Description:"
    echo "This script automates asset gathering, including subdomain enumeration, URL extraction, "
    echo "JavaScript analysis, screenshots, and parameter discovery for target domains."
    echo
    echo "Execution Levels:"
    echo "  Level 1: Requires SCOPES and optionally OUT_OF_FSCOPES for basic subdomain enumeration."
    echo "  Level 2/3: Advanced URL and JavaScript analysis without scope requirements."
    echo
    exit 0
}

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -s)
            SCOPES=$2
            shift 2
            ;;
        -oos)
            OUT_OF_FSCOPES=$2
            shift 2
            ;;
        -l)
            LEVEL=$2
            if ! [[ $LEVEL =~ ^[1-3]$ ]]; then
                echo "Error: Level must be 1 or 2 or 3."
                exit 1
            fi
            shift 2
            ;;
        -h)
            show_help
            ;;
        *)
            echo "Invalid option: $1" >&2
            show_help
            ;;
    esac
done

# Validation based on LEVEL
if [[ $LEVEL -eq 1 ]]; then
    if [[ -z "$SCOPES" ]]; then
        echo "Error: -s (scopes file) is required for Level 1."
        show_help
    fi
    if [[ ! -f "$SCOPES" ]]; then
        echo "Error: File '$SCOPES' does not exist."
        exit 1
    fi
fi

if [[ $LEVEL -eq 2 && (-n "$SCOPES" || -n "$OUT_OF_FSCOPES") ]]; then
    echo "Warning: -s and -oos options are not used in Level 2."
fi

# Asset Gathering
##############################################################################################################################

echo "Starting asset gathering..."

if [[ $LEVEL -eq 1 ]]; then
    echo "Level 1: Basic subdomain enumeration and analysis..."
    
    # Subdomain enumeration
    gates.sh -s "$SCOPES" -oos "$OUT_OF_FSCOPES" # gates.txt
    cat gates.txt | dnsx -silent -resp -nc | tee doors-full~
    cat doors-full~ | awk '{print $1}' | sort -u | tee doors.txt
    rm doors-full~
    
    # Httpx
    echo "Gathering httpx..."
    httpx.sh doors.txt
    httpx-filter.sh httpx.txt

    # httpx FFF analysis
    echo "Running Hosts FFF analysis..."
    fff.sh httpx.txt

    # doors categorize
    awk '{print $1}' httpx-full.txt | sed -E 's#https?://##' | cut -d'/' -f1 | sort -u > doors-httpx.txt
    grep -Fvxf doors-httpx.txt doors.txt > posterns.txt
    rm httpx-full.txt
    rm doors-httpx.txt

    # Port recon
    mkdir nmaps
    echo "Running nmap on main domains..."
    for postern in $(cat posterns.txt); do
        nmap "$postern" -o nmaps/"$postern"
    done

    # Screenshot httpx
    echo "Taking screenshots of httpx..."
    screenshot.sh httpx.txt
fi

if [[ $LEVEL -eq 2 ]]; then
    echo "Level 2: Advanced URL and JavaScript analysis..."
    
    # URLs
    echo "Extracting URLs..."
    url.sh -l httpx.txt
    url-filter.sh urls.txt
    url-js.sh urls.txt

    # Download JavaScript files
    echo "Downloading JavaScript files..."
    download.sh urls-js.txt

    # URLs FFF analysis
    echo "Running URLs FFF analysis..."
    fff.sh urls.txt
fi

if [[ $LEVEL -eq 3 ]]; then
    echo "Level 3: Advanced URL and JavaScript analysis..."
    
    # Paramspider
    echo "Running ParamSpider..."
    paramspider -l httpx.txt
    mv results/ paramspider/

    # Screenshot URLs
    echo "Taking screenshots of URLs..."
    screenshot.sh urls.txt
fi


echo "Asset gathering completed!"
##############################################################################################################################
