#!/bin/bash

# ----------------------------------
#  Subdomains Enumeration
# ----------------------------------

process_wildcard() {
    local SCOPES=$1

    echo "Processing scope: $SCOPES"

    # crtsh
    crtsh -d "$SCOPES" -r >> subdomains~
    echo "crtsh done for $SCOPES!"

    # subfinder
    subfinder -d "$SCOPES" >> subdomains~
    echo "subfinder done for $SCOPES!"

    # assetfinder
    echo "$SCOPES" | assetfinder -subs-only >> subdomains~
    echo "assetfinder done for $SCOPES!"

    # github-subdomains
    github-subdomains -d "$SCOPES" -t "$GITHUB_TOKEN" -o github-subdomains
    cat github-subdomains >> subdomains~ && rm github-subdomains
    echo "github-subdomains done for $SCOPES!"

    # Append unique results to subdomains.txt
    cat subdomains~ | sort -u >> subdomains.txt && rm subdomains~
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
        sed -i "/$LINE/d" subdomains.txt
    done
    echo "Removed out of scope for $SCOPES"
fi

echo "Finished!"
