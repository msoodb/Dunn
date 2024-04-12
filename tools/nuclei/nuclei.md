#!/bin/bash


# install
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest


# Usage
nuclei -u https://example.com

# UPDATE:
nuclei -up
nuclei -ut


# js analyzing
cat domains.txt | katana | grep js | httpx -mc 200 | tee js.txt
nuclei -l js.txt -t ~/nuclei-templates/exposures/ -o js_bugs.txt

```sh
file="js.txt"

# Loop through each line in the file
while IFS= read -r link
do
    # Download the JavaScript file using wget
    wget "$link"
done < "$file"
```
grep -r -E "aws_access_key|aws_secret_key|api key|passwd|pwd|heroku|slack|firebase|swagger|aws_secret_key|aws key|password|ftp password|jdbc|db|sql|secret jet|config|admin|pwd|json|gcp|htaccess|.env|ssh key|.git|access key|secret token|oauth_token|oauth_token_secret|smtp" *.js