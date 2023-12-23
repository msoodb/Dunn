=====
Scan
=====

**Auto Scan**
=============

General
----------------
- :code:`nuclei -u https://$TARGET  -nc -o nuclei`
- :code:`nikto -h https://$TARGET -o nikto.output -Format txt`
- :code:`nmap $TARGET`

Wordpress
----------------
- :code:`wpscan --url https://$TARGET --random-user-agent --wp-content-dir -e --output wpscan.token --format cli-no-color --api-token $WP_TOKEN`
- :code:`POST https://press.priceline.com/xmlrpc.php`

Joomla
----------------
- :code:`joomscan -u https://$TARGET`

**Analyze urls**
===================

URLs
----------------
- :code:`gf [awskey | base64 | json-sec | idor]`

Subdomain Takover
--------------------
- :code:`subzy run --target urls`

Broken Link Hijacking, BLH  
----------------------------

- :code:`socialhunter -f urls`

