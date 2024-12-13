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




# Display help information
nuclei -h

# Display the current version of Nuclei
nuclei -version

# Load a list of targets from a file
nuclei -l targets.txt -t ~/nuclei-templates/

# Specify a single target to test
nuclei -t https://example.com -t ~/nuclei-templates/

# Specify a URL to test
nuclei -u https://example.com -t ~/nuclei-templates/

# Run Nuclei in silent mode (suppress output)
nuclei -silent -t https://example.com -t ~/nuclei-templates/

# Specify the number of concurrent threads to use
nuclei -c 10 -t https://example.com -t ~/nuclei-templates/

# Skip templates that require authentication
nuclei -no-verify -t https://example.com -t ~/nuclei-templates/

# Customize the output format of the Nuclei report
nuclei -o output.txt -t https://example.com -t ~/nuclei-templates/

# Ignore SSL certificate errors
nuclei -insecure -t https://example.com -t ~/nuclei-templates/

# Specify a custom HTTP header to include in requests
nuclei -headers "Authorization: Bearer TOKEN" -t https://example.com -t ~/nuclei-templates/

# Specify a custom user agent string to include in requests
nuclei -user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3" -t https://example.com -t ~/nuclei-templates/