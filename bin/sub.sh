#!/bin/bash

# ----------------------------------
#  Subdomains Enumeration
# ----------------------------------

WILDCARD=$1

# crtsh
crtsh -d $WILDCARD -r >> subdomains~

# subfinder
subfinder -d $WILDCARD >> subdomains~

# assetfinder
echo  $WILDCARD | assetfinder -subs-only >> subdomains~

# github-subdomains
github-subdomains -d $WILDCARD -t $GITHUB_TOKEN -o github-subdomains
cat github-subdomains >> subdomains~ && rm github-subdomains

# pipes subdomains~ in a single file subdomains
cat subdomains~ | sort -u > subdomains && rm subdomains~

# remove out of scopes 
if [ -f outscopes ]; then
    for LINE in $(cat outscopes) ;do sed -i "/$LINE/d" subdomains;done
fi  
