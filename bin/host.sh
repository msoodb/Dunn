#!/bin/bash

# ----------------------------------
#   Hosts Enumeration
# ----------------------------------

SUBDOMAINS=$1

# hosts
httpx -l $SUBDOMAINS -sc -ip -probe -title -o hosts
