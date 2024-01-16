#!/bin/bash

# ----------------------------------
#   JS Enumeration
# ----------------------------------

URLS=$1

gowitness file --file $URLS
for I in $(ls screenshots/); do 
    echo "$I" >> screenshots/index.html;
    echo "<br/>" >> screenshots/index.html;
    echo "<img src=$I><br>" >> screenshots/index.html;
    echo "<hr/>" >> screenshots/index.html;
done
