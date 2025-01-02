#!/bin/bash

: '
            ┌──────────────────────────────────────────────────┐
            │                                                  │
            │                                                  │
            │                                       ┌─────┐    │
            │                                       │     │    │
            │              ┌──────────────┐         │     │    │
            │              │              │         └─────┘    │
            │              │       ┌─────┐│                    │
            │ ┌───┐        │       │     ││                    │
            │ │   │        │       │     ││                    │
            │ │   │        │┌────┐ │     ││                    │
            │ │   │        ││ ┌─┐│ │     ││                    │
            │ │   │        ││ │ ││ │     ││                    │
            │ │   │        ││ │ ││ │     ││                    │
            └─└───┘────────└└─└─┘┘─└─────┘┘────────────────────┘

                    Find the Doors,     Reconnaissance
                    Touch the Doors,    Phase Zero Assault
                    Select one Door,    Analysis and Assessment
                    Open the Door,      Engagement
'

## Environment
export $(grep -v '^#' ~/Projects/dunn/bin/.env | xargs -d '\n')

## Scopes
cat download_csv.csv | grep -E "WILDCARD|URL" | awk -F , '{print $1}' > scopes.txt

## Reconnaissance
recon.sh -s scopes.txt -oos out-of-scopes.txt -l 1

## Phase Zero Assault
zero-assault.sh

## Analysis and Assessment 
: ' 
    Looking for any clue to find interest host/api to scan and go deep diving.
    Processing Information: Data from reconnaissance is analyzed to understand 
    enemy positions, strengths, weaknesses, and movements.
'

# /Information/
filtered_hosts/
filtered_urls/
fff_hosts.txt/
fff_urls.txt/
js/
screenshot_hosts.txt/
screenshot_urls.txt/
nmap.*
zero_assault/
hosts*.txt
urls*.txt

# /Processing Tools/
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
nuclei -l url

# /Analysis and Assessment Result: Find interest host/api/vulnerability/cve to scan and go deep diving./
touch reconnaissance-note-operation-[]-Dec2024.md


## Engagement
mkdir engagement
touch engagement/engagement-note-operation-[]-Dec2024.md
nuclei
Burpsuit
dalfox
api
sqlmap
Browser
mfs
OWASP

[Applcation]
    [target.com]

1. application 
- file
    - /robots.txt
    - /sitemap.xml
- admin-panel
- config
- url
- tech
- cdn
    - 
2. Process 
- signup
- login
    - manual
    - oauth
- reset-password
- order
- comment
- serach
- edit-profile
- follow

3. Data
- user
- profile
- setting
- tag
- place
- city
- food
- comment
- rank

4. api
- endpoint
- token
- header

########################################################## Reference #########################################################
https://brut-ninja.medium.com/reconnaissance-strategy-and-techniques-ff43ae8f873a
https://0xpatrik.com/takeover-proofs
