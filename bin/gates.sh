#!/bin/bash

# ----------------------------------
#  Subdomains Enumeration
# ----------------------------------

OUTPUT_FILE="gates.txt"

process_wildcard() {
    local SCOPES=$1

    echo "Processing scope: $SCOPES"

    # certspotter
    # curl -s "https://api.certspotter.com/v1/issuances?domain=$SCOPES&include_subdomains=true&expand=dns_names" | jq .[].dns_names | grep -Po '(([\w.-]*)\.([\w]*)\.([A-z]))\w+' | sort -u | tee -a subdomains~
    # curl -s "https://jldc.me/anubis/subdomains/$SCOPES" | grep -Po "((http|https):\/\/)?(([\w.-]*)\.([\w]*)\.([A-z]))\w+" | sort -u | tee -a subdomains~
    # curl -s "https://crt.sh/?q=%25.$SCOPES&output=json" | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u | tee -a subdomains~
    # curl -s "https://api.hackertarget.com/hostsearch/?q=$SCOPES" | sort -u | tee -a subdomains~
    #curl -s "https://otx.alienvault.com/api/v1/indicators/domain/$SCOPES/url_list?limit=100&page=1" | grep -o '"hostname": *"[^"]*' | sed 's/"hostname": "//' | sort -u | tee -a subdomains~

    # crtsh
    echo "crtsh start for $SCOPES!"
    crtsh -d "$SCOPES" -r | tee -a subdomains~
    echo "crtsh done for $SCOPES!"

    # subfinder
    echo "subfinder start for $SCOPES!"
    subfinder -d "$SCOPES" | tee -a subdomains~
    echo "subfinder done for $SCOPES!"

    # assetfinder
    echo "assetfinder start for $SCOPES!"
    echo "$SCOPES" | assetfinder -subs-only | tee -a subdomains~
    echo "assetfinder done for $SCOPES!"

    # github-subdomains
    echo "github-subdomains start for $SCOPES!"
    github-subdomains -d "$SCOPES" -t "$GITHUB_TOKEN" -o github-subdomains
    cat github-subdomains >> subdomains~ && rm github-subdomains
    echo "github-subdomains done for $SCOPES!"

    # Append unique results to subdomains.txt
    cat subdomains~ | sort -u | tee -a $OUTPUT_FILE && rm subdomains~
    echo "subdomains done for $SCOPES!"
}

# Main script logic
if [ "$1" != "-s" ]; then
    echo "Error: Missing mandatory -s option."
    echo "Usage: $0 -s <scope> [-oos <out_of_scope_file>]"
    exit 1
fi

SCOPES=$2
OUTSCOPES=

if [ "$3" == "-oos" ]; then
    OUTSCOPES=$4
fi

if [ -z "$SCOPES" ]; then
    echo "Error: Scope is required."
    echo "Usage: $0 -s <scope> [-oos <out_of_scope_file>]"
    exit 1
fi


for SCOPE in $(cat "$SCOPES"); do
    process_wildcard "$SCOPE"
done

# Remove out-of-scope entries if specified
if [ -n "$OUTSCOPES" ] && [ -f "$OUTSCOPES" ]; then
    for LINE in $(cat "$OUTSCOPES"); do
        sed -i "/$LINE/d" $OUTPUT_FILE
    done
    echo "Removed out of scope for $SCOPES"
fi

echo "Finished!"
