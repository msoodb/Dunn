======
Scan
======
We are looking for **Live Host**, **Domain Info**, **Original IPs** and **Services**.


**Wildcard**
=============
We are looking for **Live Host**.

--------

.. note::
    For each wildcard in scope, find subdomains, and hosts.

Subdomain
-----------
- [sub.sh]
- [crtsh]
- [subfinder]
- [assetfinder]
- [subbrute]
- [amass]
- [ffuf]
- [google]
- [fierce]
- [knockpy]

Host
-----------
- [host.sh]
- [httprobe]
- [httpx]
- [fff]

**Domain**
=============
We are looking for **Domain Info** and **Original IPs**.

--------

.. code-block:: console
    
    export TARGET=www.example.com
    export IP=x.x.x.x

- Whois :code:`whois $TARGET > whois`
- WAF
    - [wafw00f]  :code:`wafw00f $TARGET > waf`
    - [`WAF-Detection <https://www.nmmapper.com/sys/reconnaissance-tools/waf/web-application-firewall-detector/>`_]
    - [p0f] TCP/IP stack fingerprinting
- DNS
    - [dig.sh]
    - [traceroute]
    - [nslookup]
    - [dnsrecon]
    - [`dnsdumpster <https://dnsdumpster.com/>`_]
    - [`dnsleaktest <https://dnsleaktest.com/>`_]
    - [DNSenum]
- IP
    - [host] :code:`host $TARGET > host`
    - [ip]: :code:`ip`
- Original-IP :code:`original-ip`
    - .. code-block:: console
    
        censys search $TARGET -o ip-data.json
        cat ip-data.json | grep -oE "(\b25[0-5]|\b2[0-4][0-9]|\b[01]?[0-9][0-9]?)(\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){3}" > ip-list
        host.sh ip-list
        cat hosts | awk '{print $1}' > hosts.url
        screenshot.sh hosts.url
        firefox screenshots/index.html  
   
    - [`shodan <https://shodan.io/dashboard/>`_ ]
    - [`censys <https://search.censys.io/>`_ ]
    - [`zoomeye <https://www.zoomeye.org/>`_ ]
- IP-Reverse
    - :code:`wget https://api.hackertarget.com/reverseiplookup/?q=$IP -O ip-reverse`
- IP-Location
    - :code:`https://ip2location.com`


**Network**
=============
We are looking for **Services**.

- Security Layer
    - IPS
    - Firewall
- Services
    - port
    - service
    - version
    - vulnerability
- [Tools]
        - [portip.sh]
        - [nmap]
        - [`shodan <https://shodan.io/dashboard/>`_ ]
        - [`censys <https://search.censys.io/>`_ ]
        - [`zoomeye <https://www.zoomeye.org/>`_ ]        

-----------

.. csv-table::
   :file: services.csv
   :widths: 30, 30, 30, 70
   :header-rows: 1

- SMB
    - [Enum4Linux]
    - [smbclient]
    - [nmap] <nmap --script smb-enum-shares.nse -p445 target.ip>
    - [VULNERABILITIES]
        - [CVE-2017-0143] [ms17-010]
            - Remote Code Execution vulnerability in Microsoft SMBv1 servers
            - https://www.exploit-db.com/exploits/43970
            - https://www.exploit-db.com/exploits/42315
- FTP
    - [ftp]
        - ftp user/anonymous to remote server 
        - put php-reverse-shell.php
    - [hydra]: bruteforce the password of the FTP Server
- Telnet
    - [telnet]
    - [netcat]
- HTTP
    - [whatweb]
    - [BurpSuite]
        - Setup and log everything
    - [Browser]
        - /robots.txt
        - /sitemap.xml
        - View Source
            - serach for path, redirect, script, href <a>, src=""
            - check all `*.js`
            - check the source of js library. are they safe?
            - diff between local js library and original from cdn    
        - View DOM very carefully
            - serach for path, redirect, script, href <a>, src=""
            - search for any query-string parameter
            - search for any search parameter
        - Analyz Network and API
            - Find endpoint
            - Find parameter
            - Watch Request/Response
            - Check statuscode
        - Read javascript code
        - Storage
            - Cookie
            - Session
        - Utelize Debugger
        - Search for any Error or Messages
            - [github.com]
            - [google.com]
        - Find Admin panel
        - Manual Analyze Code for Vulnerabilities        
            - Client-side Source Code
            - Reverse engineering mobile and desktop application
            - Leak code via vulnerability
                - Path Traversal
            - OSINT 
                - github repos
                - pastebin
            - Fast hunting
                - Find Sources
                - Find Sinks
                - Find data flow from Sources to Sinks
                - Search for known dangerous function
                    - eval()
                    - get()
                - Sensitive Data Exposure
                    - API key
                    - Database password
                    - Encryption key
                    - Username
                    - Framework
                    - Serach in comment
                    - Sensitive url
                    - [gf] find pattern in code
                    - Dependencies and third-party module and packages
                - Focus on critical methods
                    - Authentication()
                    - Payment()
                    - Checkout()
                    - Request
                    - Response
                - Follow logs
                - Attack to test what you find.
            - Utelize Atatic Analysis Security Test, SAST tools
    - Directory fuzzing
        - [dirb]
        - [dirbuster]
        - [gobuster]
        - [wfuzz]
        - [ffuf]
        - [feroxbuster]
        - [waybackurl]
        - [katana]
    - API fuzzing
        - [ffuf]
        - [wfuzz]
        - [BurpSuite]
        - [postman]
            - Set proxy to send postman request to BurpSuit
        - Log every traffic
        - Visit all resources in [Browesr]
        - Do 
            - Signup
            - Singin
            - Verification
            - Change password
            - Forgot password
            - Delete account
            - Oath login
        - Use differnet services in web application
        - Check all Request/Response
        - Check headers
        - Repeater
        - Intruder
    - [wpscan]:             Wordpress CMS scan
    - [nikto]:              Vulnerability scanning
    - [searchsploit]:       Finding web application vulnerabilities
    - [metasploit]:         Finding and exploiting web application vulnerabilities
    - [nuclei]:             Vulnerability Scanner
    - [Manual]: Find Web Applicatin Vulnerability, OWASP Top 10 
        - IDOR: Insecure Direct Object Reference
            - plain
            - base64
            - hash https://crackstation.net
            - Unpredictable
        - FI: File inclusion
            - Local File Inclusion: Attacker can include a malicious file only from the same server
            - Remote File Inclusion
        - PT: Path Traversal
        - SSRF: Server-Side Request Forgery
            - regular SSRF
            - Blind SSRF
        - XSS: Cross-site Scripting
            - Proof Of Concept
            - Session Stealing
            - Key Logger
            - Business Logic
        - RCE: Remote Code Execution
        - SQLi: SQL Injection
            - GET and POST parameters
            - Headers
            - Accept-Language
            - Host
            - referer
            - User-Agent
            - Forms/Inputs
            - REST paths /api/users/:id
            - Cookies
            - Utelize [sqlmap]
                - In-Band SQL Injection
                - Blind SQLi
            - Fetch data with 'UNION'
            - Update data in database
            - https://www.websec.ca/kb/sql_injection
        - Authentication Attack
        - Brute Force:
            - [JtR]:                Single Mode / Wordlist / Brute-Force
            - [hydra]:              Wordlist Attack, Brute Force Login
            - [crunch]:             Hybrid Dictionary Attack [crunch]
            - [RainbowCrack]:       Rainbow Tables http://project-rainbowcrack.com/table.htm
            - [wfuzz]
            - [ffuf]
        - Script
            - [2to3]:           Convert pythonRecon2 to python3
            - [python]          Run python expolit file again
    - API
        - Determine the API to be used.
            - [Fuzzing]
        - Go through the API documentation.
            - [Swagger]
            - [Stoplight]
            - [Readme]
            - [Redocly]
        - Setup environments.
            - [BurpSuite]
                - scope
                - proxy
            - [Postman]
                - import api docs into postman
                - setup proxy to burpsuite
        - Determine the attack surface includes all of the inputs and outputs of the API.
            - API calls
            - URL parameters
            - Headers
            - Cookies
            - Web responses
            - File uploads
            - API keys
        - Identify the inputs and outputs of the API.
        - Choose an authentication method.
        - Determine the API’s vulnerabilities.
- NFS
    - [mount]:              Mounting NFS shares <sudo mount -t nfs IP:share /tmp/mount/ -nolock>
- SMTP
    - [msfconsole]
- RPC
    - [nmap]            <nmap -p 111 --script=nfs-ls,nfs-statfs,nfs-showmount target.ip>
    - [rpcinfo]         <rpcinfo target.ip>
    - [showmount]       <showmount -e target.ip>
    - [mount]           <sudo mount -t nfs target.ip:/share /mnt/nfs>
    - [umount]          <sudo umount -f -l /mnt/nfs>
- SSH
    - [ssh]:
        - <ssh user@target.ip -p 22>
        - <ssh -i id_rsa user@target.ip -p 1337>
        - <ssh -i id_rsa -T user@target.ip -p 1337>
    - [hydra]
        - Brute Force Login
    - [nmap] <nmap --script ssh-auth-methods target.ip>
    - [john]
        - ssh2john id_rsa > id_rsa.hash
        - john -w=/usr/share/wordlists/rockyou.txt id_rsa.hash
- MySql
    - [mysql]
        - connet with root:root <mysql -u root -h target.ip -p>
    - [msfconsole]
    - [hydra]
        - Brute Force Login
- Redis
    - [namp] <nmap --script redis-info -sV -p 6379 target.ip>
    - [nc] 
        - <nc -vn 10.10.10.10 6379>
        - INFO
    - [redis-cli]
        - <redis-cli -h target.ip>
        - INFO
        - set password for redis 
            - <config set requirepass p@ss$12E45>
            - SAVE
- POP3
    - [telnet] <telnet target.ip 110>

- Vulnerability Scanning Tools and Public Repositories
    - [Nessus]
    - [Nexpose]
    - [OpenVAS]
    - [ExploitDB] https://www.exploit-db.com
    - [NVD] <https://nvd.nist.gov/vuln/search>
    - [Mitre] <https://www.cve.org>
    - [OVAL] <https://oval.cisecurity.org/repository>
    - [rapid7] <https://www.rapid7.com/db/>
    - [favicon] <https://wiki.owasp.org/index.php/OWASP_favicon_database>
    - [dencode] <https://dencode.com>

**Webserver** - WSTG-INFO-02
=================================
We are looking for **Webserver Info**.

- Type              
- Information Leakage
- Version           
- Vulnerability
- Metafiles - WSTG-INFO-03
    - :code:`wget https://$TARGET/robots.txt`
    - :code:`wget https://$TARGET/sitemap.xml`
    - <meta tag>
        - <META NAME="ROBOTS">
        - Burpsuite <META> Tags
        - Browser (View Source function)
    - :code:`wget https://$TARGET/security.txt`
    - :code:`wget https://$TARGET/.well-known/security.txt`
    - :code:`wget https://$TARGET/humans.txt`
- Headers
    - HSTS, HTTP Strict Transport Security
    - X-XSS-Protection
    - CORS, Cross-origin resource sharing
    - server
    - X-Powered-By
    - X-Frame-Options
    - Content-Security-Policy
    - :code:`curl -I https://$TARGET > response.headers`
        - Server
            - Server: Apache/1.3.23
            - Server: Microsoft-IIS/5.0
            - Server: Sun-ONE-Web-Server/6.1
        - Headers ordering
    - [`securityheaders <https://securityheaders.com/>`_]
- Applications - WSTG-INFO-04
    - Different Base URL
    - Non-standard Ports
    - Virtual Hosts - Wildcards    
- https://www.wappalyzer.com
- https://net-square.com/httprint.html
- Netcraft https://toolbar.netcraft.com/site_report
- Nikto https://github.com/sullo/nikto
- Nmap https://nmap.org/
- ZAP
- Burpsuite


**Web-Application**
==========================
We are looking for **Web-Applications Info**.

- Information Leakage - WSTG-INFO-05
    - Source code
    - Browser view source comment
        - `<!--      -->`
        - `/*     */`
        - `//`      
    - HTML version information <!DOCTYPE HTML>
        - “strict.dtd” -- default strict DTD
        - “loose.dtd” -- loose DTD
        - “frameset.dtd” -- DTD 
    - Burpsuite <META> Tags
        - <META name=”Author” content=”Andrew Muller”>
        - <META http-equiv=”Expires” content=”Fri, 21 Dec 201212:34:56 GMT”>
        - <META http-equiv=”Cache-Control” content=”no-cache”>
        - <META http-equiv=”Refresh” content=”15;URL=https://www.owasp.org/index.html”>
        - <META name=”robots” content=”none”>       
- Entry-points - WSTG-INFO-06
    - url
        - [url.sh]          :code:`url.sh  <host>`
        - [waybackurl]      URL enumeration
        - [katana]          Host enumeration  
    - screenshot
        - :code:`gowitness file --file $URLS`
    - fff
        - :code:`cat $URLS | fff -d 1 -S -o fff`
    - JavaScript files
        - Gather [js.sh]
        - Downlaod [js-download.sh]
        - review
            - vs code
            - ZAP
    - spiderparam
    - ZAP
    - Burp Suite
- Framework - WSTG-INFO-08
    - Name / Version
        - HTTP headers                      
            - X-Powered-By: Mono
            - X-Generator: Swiftlet               
        - HTML source code
        - Specific files and folders
        - :code:`whatweb -v -a 3 https://$TARGET --log-verbose=whatweb --color=never    # https://morningstarsecurity.com/research/whatweb`
        - Wappalyzer                                                             # wappalyzer_varonis-com
        - https://whatcms.org/?s=www.example.com
        - Cookies
            - CAKEPHP           CAKEPHP=rm72kprivgmau5fmjdesbuqi71
            - phpBB             `phpbb3_`
            - Wordpress         wp-settings
            - 1C-Bitrix         `BITRIX_`
            - AMPcms            AMP
            - Django CMS        django
            - DotNetNuke        DotNetNukeAnonymous
            - e107              e107
            - EPiServer         EPiTrace, EPiServer
            - Graffiti CMS      graffitibot
            - Hotaru CMS        hotaru_mobile
            - ImpressCMS        ICMSession
            - Indico            MAKACSESSION
            - InstantCMS        InstantCMS[logdate]
            - Kentico CMS       CMSPreferredCulture
            - MODx              SN4[12symb]
            - TYPO3             fe_typo_user
            - Dynamicweb        Dynamicweb
            - LEPTON            lep[some_numeric_value]+sessionid
            - Wix               Domain=.wix.com
            - VIVVO             VivvoSessionId
            - Laravel           laravel_session       
        - WhatWeb
        - BlindElephant.py
        - Wappalyzer
        - HTML source code
            - Wordpress         <meta name=”generator” content=”WordPress 3.9.2” />
            - phpBB             <body id=”phpbb”
            - Mediawiki         <meta name=”generator” content=”MediaWiki 1.21.9” />
            - Joomla            <meta name=”generator” content=”Joomla! - Open Source Content Management” />
            - Drupal            <meta name=”Generator” content=”Drupal 7 (http://drupal.org)” />
            - DotNetNuke        DNN Platform - http://www.dnnsoftware.com
        - Specific files and folders
            - Wordpress         /wp-includes/, /wp-admin/ and /wp-content/
    - Defaults
        - known vulnerabilities
        - default credentials
        - default settings
        - defaults and known files
    - Configuration
    - Database
    - Environments
        - development
        - sandbox
        - production
    - Logging
        - Location
        - Storage
        - Rotation
        - Access Control
        - Review
        - Sensitive Information
    - Server errors
        - 40X
        - 50X
    - File extensions
        - .asa
        - .inc
        - .config
        - .zip , .tar , .gz , .tgz , .rar , etc.: (Compressed) archive files
        - .java : No reason to provide access to Java source files
        - .txt : Text files
        - .pdf : PDF documents
        - .docx , .rtf , .xlsx , .pptx , etc.: Office documents
        - .bak , .old and other extensions indicative of backup files (for example: ~ for Emacs backup files)
    - Unreferenced Files
        - login.asp -> login.asp.old
        - viewdoc.jsp -> viewdoc.old.jsp
        - /.snapshot/monthly.1/view.php
        - viewuser.asp -> edituser.asp , adduser.asp and deleteuser.asp
        - /app/user -> /app/admin, /app/manager
    - Backup
        - js comment
        - js source code
        - cache file
        - .sql
        - .data
        - .bak
    - PaaS              
        - aws, azure, wordpress, wix
    - Session
        - JWT
        - SessionId
    - Cookie
    - Source code
        - Programming Language
        - github        
    - Third party services/APIs
        - apikey
    - js library
    - API
    - Entrypoints
        - Login
        - URL
        - Form
        - Admin panel
        - User panel
    - Admin default pages
        - WebSphere
            - /admin
            - /admin-authz.xml
            - /admin.conf
            - /admin.passwd
            - /admin/*
            - /admin/logon.jsp
            - /admin/secure/logon.jsp
        - PHP
            - /phpinfo
            - /phpmyadmin/
            - /phpMyAdmin/
            - /mysqladmin/
            - /MySQLadmin
            - /MySQLAdmin
            - /login.php
            - /logon.php
            - /xmlrpc.php
            - /dbadmin
        - FrontPage
            - /admin.dll
            - /admin.exe
            - /administrators.pwd
            - /author.dll
            - /author.exe
            - /author.log
            - /authors.pwd
            - /cgi-bin
        - WebLogic
            - /AdminCaptureRootCA
            - /AdminClients
            - /AdminConnections
            - /AdminEvents
            - /AdminJDBC
            - /AdminLicense
            - /AdminMain
            - /AdminProps
            - /AdminRealm
            - /AdminThreads
        - WordPress
            - wp-admin/
            - wp-admin/about.php
            - wp-admin/admin-ajax.php
            - wp-admin/admin-db.php
            - wp-admin/admin-footer.php
            - wp-admin/admin-functions.php
            - wp-admin/admin-header.php
    - Roles Identification
        - Roles
            - Super Admin
            - Administrator
            - Editor
            - Author
            - Contributor
            - Subscriber
        - Identification methods:
            - Application documentation.
            - Guidance by the developers or administrators of the application.
            - Application comments.
            - Fuzz possible roles:
                - cookie variable (e.g. role=admin , isAdmin=True )
                - account variable (e.g. Role: manager )
                - hidden directories or files (e.g. /admin , /mod , /backups )
                - switching to well known users (e.g. admin , backups , etc.)
- Reverse proxy
- Cloud storage
    - aws
    - gcloud
    - azure
- Application Map - WSTG-INFO-07
    - ZAP
    - Burpsuite
- Application Architecture - WSTG-INFO-10
    - Generate a map of the application at hand based on the research conducted.
- [archive]         Website History                    https://archive.org/web     
- [netcraft]        Some usefull information           https://sitereport.netcraft.com
- [Wappalyzer]      Website technology                 addons.mozilla.org
- [BuiltWith]       Website technology                 addons.mozilla.org/
- [hackertarget]    WhatWeb & Wappalyzer Scan          https://hackertarget.com
- [whatweb]         Website technology                 -
- [Firefox]         Browser, Source Code Review        -
- [BurpSuite]       Set Scope, Browser and Log         -
- [weleakinfo.io]   Info                               https://weleakinfo.io/
- [hunter.io]       Info                               https://hunter.io/

**Auto Scan**
==============

Auto Scan
-----------------
- General
    - :code:`nuclei -u https://$TARGET  -nc -o nuclei`
    - :code:`nikto -h https://$TARGET -o nikto.output -Format txt`
    - :code:`nmap $TARGET`
    - :code:`msfconsole`
- Wordpress
    - :code:`wpscan --url https://$TARGET --random-user-agent --wp-content-dir -e --output wpscan.token --format cli-no-color --api-token $WP_TOKEN`
    - :code:`POST https://press.priceline.com/xmlrpc.php`
- Joomla
    - :code:`joomscan -u https://$TARGET`

Analyze urls
-----------------
- URLs
    - :code:`gf [awskey | base64 | json-sec | idor]`
- Subdomain Takover
    - :code:`subzy run --target urls`
- Broken Link Hijacking, BLH
    - :code:`socialhunter -f urls`


**iOS Mobile app**
===================
- ...to be completed.

--------

**Android Mobile app**
=======================
- ...to be completed.

--------

**CIDR**
=========
- ...to be completed.

--------

Automated Reconnaissance and Vulnerability Repos.
=========================================================
- [recon-ng]                https://www.kali.org/tools/recon-ng
- [maltego]                 https://www.maltego.com
- [Sn1per]                  https://github.com/1N3/Sn1per
- [amass]                   https://github.com/OWASP/Amass
- [centralops]              https://centralops.net
- [Nessus]                  https://www.tenable.com
- [Nexpose]                 https://www.rapid7.com/products/nexpose
- [OpenVAS]                 https://www.openvas.org
- [ExploitDB]               https://www.exploit-db.com
- [NVD]                     https://nvd.nist.gov/vuln/search
- [Mitre]                   https://www.cve.org
- [OVAL]                    https://oval.cisecurity.org/repository
- [rapid7]                  https://www.rapid7.com/db/
- [favicon]                 https://wiki.owasp.org/index.php/OWASP_favicon_database
- [dencode]                 https://dencode.com
