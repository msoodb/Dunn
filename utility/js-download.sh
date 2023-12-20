#!/bin/bash

# ----------------------------------
#   JS Download
# ----------------------------------

JSS=$1

# get js files
for LINE in $(cat $JSS);do wget --tries=1 -P js/ "$LINE" ;done
