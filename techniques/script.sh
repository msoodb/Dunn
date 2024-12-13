
##############################################################################################################################
##  Asset gathering
##############################################################################################################################

# Dork
FGDS.sh target.com

# Subdomains
sub.sh -l wildcards.txt

# Hosts
host.sh subdomains.txt

# Urls
url.sh -l wildcards.txt
url-filter.sh urls.txt          # filtered_urls/
url-js.sh urls.txt              # urls-js.txt, urls-njs.txt

# Doanload js files
js-download.sh urls-js.txt      # js/

# Screenshot all urls
screenshot.sh urls-njs.txt

# fff
fff.sh urls-njs.txt


##############################################################################################################################
##  Looking for any clue
##############################################################################################################################

# port
naabu -host target.com
nmap target.com

# nuclei
nuclei -u target.com
nuclei -u target.com -t technologies
nuclei -u target.com -t cves

# fff/
gf  aws-keys|debug-pages|go-functions|json-sec|php-errors|php-sources|servers|upload-fields|
    base64|firebase|http-auth|meg-headers|php-serialized|s3-buckets|strings|urls|
    cors|fw|ip|php-curl|php-sinks|sec|takeovers

# js/
gf  aws-keys|debug-pages|go-functions|json-sec|php-errors|php-sources|servers|upload-fields|
    base64|firebase|http-auth|meg-headers|php-serialized|s3-buckets|strings|urls|
    cors|fw|ip|php-curl|php-sinks|sec|takeovers

# Vulnerabilities, CVEs, exposures
nuclei -l hosts.txt \
    -t ~/nuclei-templates/http/vulnerabilities/ \
    -t ~/nuclei-templates/http/cves/ \
    -t ~/nuclei-templates/http/exposures/ -o hosts.txt.vuln

# filtered_urls
cd filtered_urls/
nuclei -l accout.txt 

##############################################################################################################################
## TEST
##############################################################################################################################

# 403
403.sh hosts-403.txt

# XSS - I
grep "?" urls-njs.txt > urls-njs-params.txt
cat urls-njs-params.txt | kxss | tee urls-njs-kxss.txt
cat urls-njs-kxss.txt | grep \" | awk '{print $2}' > urls-njs-kxss-vuln.txt
dalfox file urls-njs-kxss-vuln.txt -o dalfox.txt

# XSS - II
grep -E "(search|query|id|lang|page)=" urls-params.txt > urls-params-potential-xss.txt
urls-test-payload.py urls-params-potential-xss.txt
nuclei -l urls-params-potential-xss.txt -tags xss
cat urls-params-potential-xss.txt | dalfox pipe -b localhost
cat urls-params-potential-xss.txt | httpx -mc 200 -ct "text/html" | tee urls-params-potential-xss-html.txt

# XSS - III
paramspider -d target.com
cat results/target.com.txt | kxss | tee results/target.com.txt.kxss

# Subdomain takeovers
nuclei -l hosts.txt -t ~/nuclei-templates/http/takeovers/
subzy run --targets hosts.txt
dig tomoni-allure-reports.api-system.tomtom.com any


# Broken Link Hijacking
socialhunter -f hosts.txt
socialhunter -f urls-njs.txt

########################################################## Reference #########################################################
https://brut-ninja.medium.com/reconnaissance-strategy-and-techniques-ff43ae8f873a
https://0xpatrik.com/takeover-proofs
##############################################################################################################################