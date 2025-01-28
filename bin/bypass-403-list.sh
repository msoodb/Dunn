#! /bin/bash

LIST=$1
echo "Starting 403 Bypass scans..."
for LINE in $(cat $LIST); do
    bypass-403.sh "$LINE" | tee -a "$LIST.bypass"
done
echo "Starting 403 Bypass scans...done!"