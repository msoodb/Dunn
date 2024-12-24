#!/bin/bash



##  Environment
export $(grep -v '^#' ~/Projects/dunn/bin/.env | xargs -d '\n')

##  Targets Scopes
touch targets.txt && touch scopes.txt
cat download_csv.csv | grep "WILDCARD|URL" | awk -F , '{print $1}' >> scopes.txt


##                                                  Reconnaissance
##############################################################################################################################
recon.sh -t targets.txt -s scopes.txt -l 1
recon.sh -t targets.txt -s scopes.txt -l 2



##                                                  Phase Zero Assault
##############################################################################################################################
phase-zero-assault.sh


##                  Looking for any clue to find interest host/api to scan and go deep diving.
##############################################################################################################################

# sources
filtered_hosts/
filtered_urls/
fff_hosts.txt/
fff_urls.txt/
js/
screenshot_hosts.txt/
screenshot_urls.txt/
nmap
phase_zero_assault/


# tools
cat subzy.hosts.txt | grep -v "NOT VULNERABLE" | grep -v "HTTP ERROR" | tee subzy.hosts.txt.valn
dig .... any
cat phase_zero_assault/403-hosts.txt.result | grep 200
gf
nuclei -l accout.txt 
Burpsuit
firefox $(cat dev.txt)



########################################################## Reference #########################################################
https://brut-ninja.medium.com/reconnaissance-strategy-and-techniques-ff43ae8f873a
https://0xpatrik.com/takeover-proofs
##############################################################################################################################