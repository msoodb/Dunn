#!/bin/bash

# ----------------------------------
#   JS Enumeration
# ----------------------------------

URLS=$1

# js files
cat $URLS | subjs | tee -a jss~

# pipes jss~ in a single file jss
cat jss~ | sort -u > jss && rm jss~
