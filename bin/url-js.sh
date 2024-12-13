#!/bin/bash

# ----------------------------------
#   JS Enumeration
# ----------------------------------

URLS=$1

# js files
#cat $URLS | subjs | tee -a jss~

# pipes jss~ in a single file jss
#cat jss~ | sort -u > url-js.txt && rm jss~

grep -Ei '\.js(\?.*)?$' $URLS > urls-js.txt

grep -vEi '\.js(\?.*)?$' $URLS > urls-njs.txt


