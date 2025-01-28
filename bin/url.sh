#!/bin/bash

# ----------------------------------
#   URLs Enumeration
# ----------------------------------

process_target() {
    local TARGET=$1
    local OUTSCOPES=$2

    echo "Processing target: $TARGET"

    # katana
    katana -u "$TARGET" -fs=fqdn | tee -a urls~
    echo "katana done for $TARGET!"

    # waybackurls
    #echo "$TARGET" | waybackurls | tee -a urls~
    #echo "waybackurls done for $TARGET!"

    # Combine and deduplicate URLs
    cat urls~ | sort -u >> urls-all.txt && rm urls~
    echo "URLs combined and deduplicated for $TARGET!"

    # Remove out-of-scope URLs if specified
    if [ -n "$OUTSCOPES" ] && [ -f "$OUTSCOPES" ]; then
        for LINE in $(cat "$OUTSCOPES"); do
            sed -i "/$LINE/d" urls-all.txt
        done
        echo "Out-of-scope URLs removed for $TARGET!"
    fi
}

# Main script logic
if [[ "$1" == "-l" && -n "$2" ]]; then
    # Process a file with targets
    TARGETS_FILE=$2
    OUTSCOPES=$3

    if [ ! -f "$TARGETS_FILE" ]; then
        echo "Error: File $TARGETS_FILE does not exist."
        exit 1
    fi

    while IFS= read -r TARGET; do
        process_target "$TARGET" "$OUTSCOPES"
    done < "$TARGETS_FILE"
else
    # Process a single target
    TARGET=$1
    OUTSCOPES=$2

    if [ -z "$TARGET" ]; then
        echo "Usage: $0 [-l target_file] [target] [out_of_scope_file]"
        exit 1
    fi

    process_target "$TARGET" "$OUTSCOPES"
fi

cat urls-all.txt | uro | tee urls.txt

echo "Finished!"
