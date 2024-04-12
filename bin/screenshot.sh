#!/bin/bash

# ----------------------------------
#   JS Enumeration
# ----------------------------------

URLS="${1:-urls}"
OUTPUT_DIR="${2:-screenshot}"

gowitness file --file $URLS --screenshot-path $OUTPUT_DIR
for I in $(ls $OUTPUT_DIR/); do 
    echo "$I" >> $OUTPUT_DIR/index.html;
    echo "<br/>" >> $OUTPUT_DIR/index.html;
    echo "<img src=$I><br>" >> $OUTPUT_DIR/index.html;
    echo "<hr/>" >> $OUTPUT_DIR/index.html;
done
