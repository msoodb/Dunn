#!/bin/bash

# ----------------------------------
#  Bypass 403
# ----------------------------------

HOSTS=$1

for LINE in $(cat $HOSTS) ;do bypass-403.sh $LINE | tee -a $HOSTS.result;done
