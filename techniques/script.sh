#!/bin/bash



##  Environment
export $(grep -v '^#' ~/Projects/dunn/bin/.env | xargs -d '\n')

##  Targets & Scopes
touch targets.txt && touch scopes.txt
cat download_csv.csv | grep "WILDCARD" | awk -F , '{print $1}' >> scopes.txt
cat download_csv.csv | grep "URL" | awk -F , '{print $1}' >> scopes.txt


##                                                  Reconnaissance
recon.sh -t targets.txt -s scopes.txt -l 1
recon.sh -t targets.txt -s scopes.txt -l 2
recon.sh -t targets.txt -s scopes.txt -l 3



##                                                  Phase Zero Assault
zero-assault.sh


##                  Looking for any clue to find interest host/api to scan and go deep diving.

mkdir assault_alpha
touch assault_alpha/tacticals.txt   # List of AttackSurface List. Add every interesting url/host/api/app/


# sources
filtered_hosts/
filtered_urls/
fff_hosts.txt/
fff_urls.txt/
js/
screenshot_hosts.txt/
screenshot_urls.txt/
nmap.*
zero_assault/
hosts.txt
urls.txt

# tools
find -type f -empty -delete
wcall
dig .... any
gf s3-buckets >> ../assault_alpha/aws-s3.txt   # fff_hosts.txt/, fff_urls.txt/
gf http-auth >> ../assault_alpha/info.txt   # fff_hosts.txt/, fff_urls.txt/
gf urls >> ../assault_alpha/jss-urls.txt   # js/
grep -E "https://[^/]+\.s3\.amazonaws\.com(/|$)" jss-urls.txt > jss-urls-s3.txt

fff_urls.txt]$ gf json-sec >> ../assault_alpha/json-sec.txt
fff_hosts.txt]$ gf json-sec >> ../assault_alpha/json-sec.txt
js]$ gf json-sec >> ../assault_alpha/json-sec.txt 

paramspider]$ dalfox file productboard.com.txt -b bugbountyicodeidc.bxss.in -o hasil-redacted.txt
paramspider]$ dalfox file satismeter.com.txt -b bugbountyicodeidc.bxss.in -o hasil-redacted.txt

grep "\.s3\." jss-urls.txt
foxopen  dev.txt
screenshot dev.txt






##                          Find interest host/api/vulnerability/cve to scan and go deep diving.
/assault_alpha/tacticals.txt
nuclei -l tactical-url
Burpsuit



########################################################## Reference #########################################################
https://brut-ninja.medium.com/reconnaissance-strategy-and-techniques-ff43ae8f873a
https://0xpatrik.com/takeover-proofs
##############################################################################################################################