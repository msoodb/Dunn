#!/bin/bash

# ----------------------------------
#   JS Enumeration
# ----------------------------------

FILE="$1"
OUTPUT_DIR="screenshot_$FILE"

gowitness file --file $FILE --threads 1 --delay 5 --disable-db  --resolution-x 720 --resolution-y 450 --screenshot-path $OUTPUT_DIR
for I in $(ls $OUTPUT_DIR/); do 
    echo "$I" >> $OUTPUT_DIR/index.html;
    echo "<br/>" >> $OUTPUT_DIR/index.html;
    echo "<img src=$I><br>" >> $OUTPUT_DIR/index.html;
    echo "<hr/>" >> $OUTPUT_DIR/index.html;
done
