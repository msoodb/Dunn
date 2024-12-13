#!/bin/bash

# ----------------------------------
#  Subdomains Enumeration
# ----------------------------------

process_wildcard() {
    local WILDCARD=$1
    local OUTSCOPES=$2

    echo "Processing wildcard: $WILDCARD"

    # crtsh
    crtsh -d "$WILDCARD" -r >> subdomains~
    echo "crtsh done for $WILDCARD!"

    # subfinder
    subfinder -d "$WILDCARD" >> subdomains~
    echo "subfinder done for $WILDCARD!"

    # assetfinder
    echo "$WILDCARD" | assetfinder -subs-only >> subdomains~
    echo "assetfinder done for $WILDCARD!"

    # github-subdomains
    github-subdomains -d "$WILDCARD" -t "$GITHUB_TOKEN" -o github-subdomains
    cat github-subdomains >> subdomains~ && rm github-subdomains
    echo "github-subdomains done for $WILDCARD!"

    # Append unique results to subdomains.txt
    cat subdomains~ | sort -u >> subdomains.txt && rm subdomains~
    echo "subdomains done for $WILDCARD!"

    # Remove out-of-scope entries if specified
    if [ -n "$OUTSCOPES" ] && [ -f "$OUTSCOPES" ]; then
        for LINE in $(cat "$OUTSCOPES"); do
            sed -i "/$LINE/d" subdomains.txt
        done
        echo "Removed out of scope for $WILDCARD"
    fi
}

# Main script logic
if [[ "$1" == "-l" && -n "$2" ]]; then
    # Process a file with wildcards
    WILDCARDS_FILE=$2
    OUTSCOPES=$3

    if [ ! -f "$WILDCARDS_FILE" ]; then
        echo "Error: File $WILDCARDS_FILE does not exist."
        exit 1
    fi

    while IFS= read -r WILDCARD; do
        process_wildcard "$WILDCARD" "$OUTSCOPES"
    done < "$WILDCARDS_FILE"
else
    # Process a single wildcard
    WILDCARD=$1
    OUTSCOPES=$2

    if [ -z "$WILDCARD" ]; then
        echo "Usage: $0 [-l wildcard_file] [wildcard] [out_of_scope_file]"
        exit 1
    fi

    process_wildcard "$WILDCARD" "$OUTSCOPES"
fi

echo "Finished!"
