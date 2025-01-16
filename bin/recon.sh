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
    echo "  -s FILE   File containing scopes (domains, URLs, and wildcards in scope)."
    echo "  -oos FILE File containing out of scopes (optional)."
    echo "  -l LEVEL  Level of execution (1 to 3)."
    echo "  -h        Show this help message and exit."
    echo
    echo "Description:"
    echo "This script automates asset gathering, including subdomain enumeration, URL extraction, "
    echo "JavaScript analysis, screenshots, and parameter discovery for target domains."
    echo "The level parameter controls which steps are executed:"
    echo "  Level 1: FGDS.sh and subdomain enumeration."
    echo "  Level 2: Adds host gathering and filtering."
    echo "  Level 3: Adds screenshots and FFF analysis."
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
                echo "Error: Level must be an integer between 1 and 3."
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


# Check if required arguments are provided
if [[ -z "$SCOPES" || -z "$LEVEL" ]]; then
    echo "Error: -s (scopes file) and -l (level) are required."
    show_help
fi

if [[ ! -f "$SCOPES" ]]; then
    echo "Error: File '$SCOPES' does not exist."
    exit 1
fi

# Asset Gathering
##############################################################################################################################

echo "Starting asset gathering..."

if [[ $LEVEL -eq 1 ]]; then
    
    # Subdomanins
    sub.sh -s "$SCOPES" -oos "$OUT_OF_FSCOPES"
    
    # Hosts
    echo "Gathering hosts..."
    host.sh subdomains.txt
    host-filter.sh hosts.txt

    # URLs
    echo "Extracting URLs..."
    url.sh -l hosts.txt
    url-filter.sh urls.txt
    url-js.sh urls.txt

    # Download JavaScript files
    echo "Downloading JavaScript files..."
    download.sh urls-js.txt

    # Port recon
    echo "Running nmap on main domains..."
    for SCOPE in $(cat "$SCOPES"); do
        nmap "$SCOPE" -o nmap."$SCOPE"
        # naabu -host "$SCOPE"
    done

fi

if [[ $LEVEL -eq 2 ]]; then

    # Hosts FFF analysis
    echo "Running Hosts FFF analysis..."
    fff.sh hosts.txt

    # URLs FFF analysis
    echo "Running URLs FFF analysis..."
    fff.sh urls.txt

    # Paramspider
    echo "Running ParamSpider..."
    paramspider -l $SCOPES
    mv results/ paramspider/
    
fi

if [[ $LEVEL -eq 3 ]]; then

    # Screenshot Hosts
    echo "Taking screenshots of Hosts..."
    screenshot.sh hosts.txt

     # Screenshot URLs
    echo "Taking screenshots of URLs..."
    screenshot.sh urls.txt

    # Dorking
    #echo "Running FGDS.sh on main domains..."
    #for TARGET in $(cat "$TARGETS"); do
    #    FGDS.sh "$TARGET"
    #done
    
fi

echo "Asset gathering completed!"
##############################################################################################################################
