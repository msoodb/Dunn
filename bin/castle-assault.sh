#!/bin/bash

figlet CASTLE.scan
# Script Name: castle_assault.sh
# Description: Castle vulnerability scanning script.
# Author: msoodb

# IPs
gf ip-m  | sort -u > ips.txt
for ip in ips:
    dig -x ip
done

# Auto Scan
nuclei -l castles.txt -o nuclei.scastles.txt

# Subdomain Takeovers
nuclei -l httpx.txt -t ~/nuclei-templates/http/takeovers/ -o nuclei-takeovers-httpx.txt
subzy run --targets httpx.txt | tee subzy-httpx.txt


# 403 Bypass
bypass-403-list.sh httpx-403.txt

# Broken Link Hijacking (BLH)
socialhunter -f httpx.txt -w 10 | tee socialhunter.httpx.txt
