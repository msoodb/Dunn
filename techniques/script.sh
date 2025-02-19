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


                    Reconnaissance              Find all gates
                    Scanning and Enumeration
                    Gaining Access
                    Maintaining Access
                    Covering Tracks
                    

                    castle                  wildcard 
                    gates                   subdomains
                    doors                   resolved subdomains
                    https                   httpx resolved subdomains
'

## Start
    export $(grep -v '^#' ~/Projects/dunn/bin/.env | xargs -d '\n')
    scope.py download_csv.csv

## 1. Find all/httpx Doors
    : ' Reconnaissance '
    recon.sh castle -l 1 -s scopes.txt -oos out-of-scopes.txt
    zero-assault.sh

## 2. Select one Door
: ' 
    Study, Analysis, and Assessment.
    Looking for any clue to find interest host/api to scan and go deep diving.
    Processing Information: Data from reconnaissance is analyzed to understand 
    enemy positions, strengths, weaknesses, and movements.
'
    # /Information Sources/
    filtered_httpx/
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
    python linkfinder.py -i http://verily.com  # git clone https://github.com/GerbenJavado/LinkFinder.git
    dalfox file productboard.com.txt -b bugbountyicodeidc.bxss.in -o hasil-redacted.txt # paramspider

    # /Analysis and Assessment Result: Find interest host/api/vulnerability/cve to Deep Reconnaissance and Scan./
    touch reconnaissance-note-operation-[]-Dec2024.md
    
## 4. Reconnaissance/Scan the Door
    : 'Deep Reconnaissance and Scan'
    recon.sh -l 2
    recon.sh -l 3

## 5. Open the Door
    : 'Engagement'
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

    #/ If failed Go back to step 3. Select one Door #/

## end

https://brut-ninja.medium.com/reconnaissance-strategy-and-techniques-ff43ae8f873a
https://0xpatrik.com/takeover-proofs
