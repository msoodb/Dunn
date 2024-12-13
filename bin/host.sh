#!/bin/bash

# ----------------------------------
#   Hosts Enumeration
# ----------------------------------

SUBDOMAINS=$1

# hosts
httpx -l $SUBDOMAINS -sc -ip -probe -title -nc -o hosts-httpx.txt


# hosts.txt
cat hosts-httpx.txt | grep SUCCESS | awk '{print $1}' > hosts.txt

# subdomains-live.txt
# cat hosts-httpx.txt | awk -F // '{print $2}' > subdomains-live.txt

# hosts-403.txt
cat hosts-httpx.txt | grep 403 | awk '{print $1}' > hosts-403.txt

# hosts-404.txt
cat hosts-httpx.txt | grep 404 | awk '{print $1}' > hosts-404.txt