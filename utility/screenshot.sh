#!/bin/bash

# ----------------------------------
#   JS Enumeration
# ----------------------------------

URLS=$1

gowitness file --file $URLS
for I in $(ls); do 
    echo "$I" >> index.html;
    echo "<br/>" >> index.html;
    echo "<img src=$I><br>" >> index.html;
    echo "<hr/>" >> index.html;
done
