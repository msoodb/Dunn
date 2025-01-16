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

# /Information Sources/
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
gf
grep

# /Extrsct Data/
grep -rEho '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}' . | sort | uniq > zero_assault/emails.txt
gf s3-buckets >> zero_assault/aws-s3.txt
grep -rEho "https://[^/]+\.s3\.amazonaws\.com(/|$)" . >> zero_assault/aws-s3.txt
grep "\.s3\." urls.txt >> zero_assault/aws-s3.txt
gf http-auth >> ero_assault/http-auth.txt
gf urls >> zero_assault/urls.txt
gf json-sec >> zero_assault/json-sec.txt
foxopen  dev.txt
screenshot dev.txt
nuclei -l url
curl -X POST https://pokerman.onrender.com/logs -H "Content-Type: application/json" -d '{"name": "John Doe", "age": 45}'


# /Analysis and Assessment Result: Find interest host/api/vulnerability/cve to scan and go deep diving./
touch reconnaissance-note-operation-[]-Dec2024.md
python linkfinder.py -i http://verily.com  # git clone https://github.com/GerbenJavado/LinkFinder.git


## Engagement
mkdir engagement
touch engagement/engagement-note-operation-[]-Dec2024.md
dalfox file productboard.com.txt -b bugbountyicodeidc.bxss.in -o hasil-redacted.txt # paramspider

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
