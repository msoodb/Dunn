#!/bin/bash

# ----------------------------------
#   URLs Enumeration
# ----------------------------------

TARGET=$1

# waybackurls
echo $TARGET | waybackurls  | tee -a urls~
# waybackurls $TARGET | tee -a urls.wayback
# cat urls.wayback | sort -u > urls.wayback.su
# cat urls.wayback.su | grep -E "^http.?://www\.example\.com" > urls.wayback.su.inscope


# katana
katana -u $TARGET -fs=fqdn | tee -a urls~

# pipes urls~ in a single file urls
cat urls~ | sort -u > urls && rm urls~
