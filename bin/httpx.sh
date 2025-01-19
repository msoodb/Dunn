#!/bin/bash

# ----------------------------------
#   httpx Enumeration
# ----------------------------------

SUBDOMAINS=$1

# httpx
httpx -l $SUBDOMAINS -sc -ip -probe -title -nc -o httpx-full.txt


grep "\[SUCCESS\] \[200\]" httpx-full.txt | awk '{print $1}' > httpx.txt
grep "\[SUCCESS\] \[3..\]" httpx-full.txt | awk '{print $1}' >> httpx.txt
grep "\[SUCCESS\] \[2..\]" httpx-full.txt | awk '{print $1}' > httpx-2xx.txt
grep "\[SUCCESS\] \[3..\]" httpx-full.txt | awk '{print $1}' > httpx-3xx.txt
grep "\[SUCCESS\] \[403\]" httpx-full.txt | awk '{print $1}' > httpx-403.txt
grep "\[SUCCESS\] \[404\]" httpx-full.txt | awk '{print $1}' > httpx-404.txt
grep "\[SUCCESS\] \[5..\]" httpx-full.txt | awk '{print $1}' > httpx-5xx.txt