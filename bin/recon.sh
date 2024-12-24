#!/bin/bash

# Default variables
TARGETS=""
SCOPES=""
LEVEL=0

# Help function
function show_help {
    echo "Usage: $0 [options]"
    echo
    echo "Options:"
    echo "  -t FILE   File containing main domains (one per line)."
    echo "  -s FILE   File containing scopes (domains, URLs, and wildcards in scope)."
    echo "  -l LEVEL  Level of execution (1 to 5)."
    echo "  -h        Show this help message and exit."
    echo
    echo "Description:"
    echo "This script automates asset gathering, including subdomain enumeration, URL extraction, "
    echo "JavaScript analysis, screenshots, and parameter discovery for target domains."
    echo "The level parameter controls which steps are executed:"
    echo "  Level 1: FGDS.sh and subdomain enumeration."
    echo "  Level 2: Adds host gathering and filtering."
    echo "  Level 3: Adds screenshots and FFF analysis."
    echo "  Level 4: Adds URL extraction and JavaScript analysis."
    echo "  Level 5: Full execution, including nmap and ParamSpider."
    echo
    exit 0
}

# Parse command-line arguments
while getopts ":t:s:l:h" opt; do
    case $opt in
        t)
            TARGETS=$OPTARG
            ;;
        s)
            SCOPES=$OPTARG
            ;;
        l)
            LEVEL=$OPTARG
            if ! [[ $LEVEL =~ ^[1-5]$ ]]; then
                echo "Error: Level must be an integer between 1 and 5."
                exit 1
            fi
            ;;
        h)
            show_help
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            show_help
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            show_help
            ;;
    esac
done

# Check if required files are provided
if [[ -z "$TARGETS" || -z "$SCOPES" ]]; then
    echo "Error: Both -t (main domains file) and -s (scopes file) are required."
    show_help
fi

if [[ ! -f "$TARGETS" ]]; then
    echo "Error: File '$TARGETS' does not exist."
    exit 1
fi

if [[ ! -f "$SCOPES" ]]; then
    echo "Error: File '$SCOPES' does not exist."
    exit 1
fi

# Asset Gathering
##############################################################################################################################

echo "Starting asset gathering..."

if [[ $LEVEL -eq 1 ]]; then
    
    # Subdomains
    echo "Enumerating subdomains..."
    sub.sh -l "$SCOPES"

    # Hosts
    echo "Gathering hosts..."
    host.sh subdomains.txt
    grep 403 hosts-httpx.txt | awk '{print $1}' > 403-hosts.txt
    grep 404 hosts-httpx.txt | awk '{print $1}' > 404-hosts.txt
    host-filter.sh hosts.txt

    # URLs
    echo "Extracting URLs..."
    url.sh -l "$SCOPES"
    url-filter.sh urls.txt
    url-js.sh urls.txt

    # Download JavaScript files
    echo "Downloading JavaScript files..."
    js-download.sh urls-js.txt

    # Port recon
    echo "Running nmap on main domains..."
    for TARGET in $(cat "$TARGETS"); do
        nmap "$TARGET" -o nmap."$TARGET"
        # naabu -host "$TARGET"
    done

fi

if [[ $LEVEL -eq 2 ]]; then

    # Hosts FFF analysis
    echo "Running Hosts FFF analysis..."
    fff.sh hosts.txt

    # URLs FFF analysis
    echo "Running URLs FFF analysis..."
    fff.sh urls.txt

    # Screenshot Hosts
    echo "Taking screenshots of Hosts..."
    screenshot.sh hosts.txt

     # Screenshot URLs
    echo "Taking screenshots of URLs..."
    screenshot.sh urls.txt

    # Paramspider
    echo "Running ParamSpider..."
    paramspider -l $TARGETS
    mv results/ paramspider/

    # Dorking
    echo "Running FGDS.sh on main domains..."
    for TARGET in $(cat "$TARGETS"); do
        FGDS.sh "$TARGET"
    done
    
fi

echo "Asset gathering completed!"
##############################################################################################################################
