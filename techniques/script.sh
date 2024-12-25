#!/bin/bash



##  Environment
export $(grep -v '^#' ~/Projects/dunn/bin/.env | xargs -d '\n')

##  Targets Scopes
touch targets.txt && touch scopes.txt
cat download_csv.csv | grep "WILDCARD|URL" | awk -F , '{print $1}' >> scopes.txt


##                                                  Reconnaissance
recon.sh -t targets.txt -s scopes.txt -l 1
recon.sh -t targets.txt -s scopes.txt -l 2
recon.sh -t targets.txt -s scopes.txt -l 3



##                                                  Phase Zero Assault
zero-assault.sh


##                  Looking for any clue to find interest host/api to scan and go deep diving.
# sources
filtered_hosts/
filtered_urls/
fff_hosts.txt/
fff_urls.txt/
js/
screenshot_hosts.txt/
screenshot_urls.txt/
nmap
zero_assault/

# tools
mkdir assault_alpha
wcall
dig .... any
gf s3-buckets >> ../assault_alpha/aws-s3.txt   # fff_hosts.txt/, fff_urls.txt/
gf http-auth >> ../assault_alpha/info.txt   # fff_hosts.txt/, fff_urls.txt/
foxopen  dev.txt
screenshot dev.txt
nuclei -l accout.txt 
Burpsuit


##                          Find interest host/api/vulnerability/cve to scan and go deep diving.



########################################################## Reference #########################################################
https://brut-ninja.medium.com/reconnaissance-strategy-and-techniques-ff43ae8f873a
https://0xpatrik.com/takeover-proofs
##############################################################################################################################