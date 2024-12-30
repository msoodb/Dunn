#!/bin/bash

# ----------------------------------
#   Hosts Enumeration
# ----------------------------------

SUBDOMAINS=$1

# hosts
httpx -l $SUBDOMAINS -sc -ip -probe -title -nc -o hosts-httpx.txt


grep "\[SUCCESS\] \[200\]" hosts-httpx.txt | awk '{print $1}' > hosts.txt
grep "\[SUCCESS\] \[3..\]" hosts-httpx.txt | awk '{print $1}' > hosts-3xx.txt
grep "\[SUCCESS\] \[403\]" hosts-httpx.txt | awk '{print $1}' > hosts-403.txt
grep "\[SUCCESS\] \[404\]" hosts-httpx.txt | awk '{print $1}' > hosts-404.txt
grep "\[SUCCESS\] \[5..\]" hosts-httpx.txt | awk '{print $1}' > hosts-5xx.txt