#!/bin/bash

# ----------------------------------
#   Hosts Enumeration
# ----------------------------------

SUBDOMAINS=$1

# hosts
httpx -l $SUBDOMAINS -sc -ip -probe -title -o hosts


# hosts.lives
cat hosts | grep SUCCESS | awk '{print $1}' > hosts.live

# subdomains.live
cat hosts.live | awk -F // '{print $2}' > subdomains.live