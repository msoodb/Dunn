======
Recon
======

**Company**
============

.. list-table::
   :widths: 25 75

   * - Name
     -
   * - Website
     - 
   * - Brands
     -   

History
----------

- History

Leaked-info
-------------

- Document
    - `google <https://www.google.com/>`_ site:example.com filetype:pdf inurl:login cache:example.com
- User:Email:Password
    - [`rocketreach <https://rocketreach.co/>`_ ] email and phone
    - [`pastebin <https://pastebin.com/>`_ ] leaked password
    - [`haveibeenpwned <https://haveibeenpwned.com//>`_ ] password reuse attack
    - SocialMedia
        - `Linkedin <https://www.linkedin.com/>`_ 
        - `Instagram <https://www.instagram.com//>`_ 
        - `facebook <https://www.facebook.com//>`_
- Source-code
    - [`github <https://github.com/>`_ ] code, api-key and data leak
- Server:IP:Port
    - [`shodan <https://shodan.io/dashboard/>`_ ]
    - [`censys <https://search.censys.io/>`_ ]
    - [`zoomeye <https://www.zoomeye.org/>`_ ]
- Other tools
    - `Google Hacking Database <https://www.exploit-db.com/google-hacking-database/>`_ 
    - search engine
        - [Baidu]
        - [binsearch.info]
        - [Bing]
        - [DuckDuckGo]
        - [ixquick/Startpage]
    - etc
        - [PunkSpider]
        - [`OSINT Framework <https://osintframework.com/>`_]
        - [theHarvester]    OSINT platform
        - [`alerts <https://google.com/alerts/>`_]          Set google change alert            

Website-info
-------------
- Technology
    - Web Server
    - CMS
    - DBMS
    - Operation System
- Contact
    - Name
    - Role
    - Contact
- Location
    - Name
    - Location
- Business
    - Registration
    - Authentication
    - Online shopping
    - Payment
    - Checkout
    - Search
- Form and Entrypoint
    - Form
    - url
    - api
- Leaked-data
    - file: pdf, txt, xls, sql, conf
    - backup
    - configuration
    - web archive

Key persons
------------
.. csv-table::
   :file: key-persons.csv
   :widths: 20, 20, 20, 20, 20
   :header-rows: 1

Business
---------
- Processes
    - online shopping
    - user management
    - single sign on
    - payment
    - upload document
- Payment-gateway
    - PayPal
    - Card
    - Bank

Partners
-----------

.. csv-table::
   :file: partners.csv
   :widths: 30, 30, 30
   :header-rows: 1

Infrastructure
-----------------

- Technology
    - Database
    - OS
    - Programming Language
    - Code Repository
    - Cloud
    - Deployment
- Network
    - Public
    - Private
    - Cloud
    - Firewall
    - CIDR
    - [fping]
    - [ping]
    - [nmap]
    - [rustscan]
- Firewall
    - IPS
    - Firewall
    - WAF
- Cloud
    - IaaS
    - CaaS
    - PaaS
    - FaaS
    - SaaS
    - Storage
- Applications
    - Web-servers
    - Mail-server
    - CRM
    - HR
    - ERP
    - E-Learning
    - User-Directory
- API
    - BaseURL
    - Version
    - Document

**Wildcard**
=============

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

.. code-block:: console
    
    export $TARGET=www.example.com
    export $IP=x.x.x.x

Network
-----------
    - IP
        - [host] :code:`host $TARGET > ip`
        - [Original-ip]     https://securitytrails.com
        - [Original-ip]     https://zoomeye.org
    - IP.Reverse
        - :code:`wget https://api.hackertarget.com/reverseiplookup/?q=$IP > ip.reverse`
    - DNS
        - [dig.sh]
        - [traceroute]
        - [nslookup]
        - [dnsrecon]
        - [`dnsdumpster <https://dnsdumpster.com/>`_]
        - [`dnsleaktest <https://dnsleaktest.com/>`_]
        - [DNSenum]        
    - Location
        - :code:`https://ip2location.com`
    - WAF
        - [wafw00f]  :code:`wafw00f $TARGET > waf`
        - [`WAF-Detection <https://www.nmmapper.com/sys/reconnaissance-tools/waf/web-application-firewall-detector/>`_]
        - [p0f] TCP/IP stack fingerprinting
    - IPS
    - Whois
        - [whois] :code:`whois $TARGET > whois`
    - Port
        - number
        - service
        - version
        - vulnerability
        - [portip.sh]
        - [nmap]
        - [`shodan <https://shodan.io/dashboard/>`_ ]
        - [`censys <https://search.censys.io/>`_ ]
        - [`zoomeye <https://www.zoomeye.org/>`_ ]        

-----

Services
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

Web server
-----------
- type              
- information leakage
- version           
- vulnerability
- Metafiles
    - :code:`wget https://$TARGET/robots.txt`
    - :code:`wget https://$TARGET/sitemap.xml`
    - <meta tag>
        - <META NAME="ROBOTS">
        - Burpsuite <META> Tags
        - Browser (View Source function)
- Headers
    - HSTS
    - X-XSS-Protection
    - CORS
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
- https://www.netcraft.com/
- https://www.wappalyzer.com
- https://net-square.com/httprint.html

Web application
-----------------
    - information leakage
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
    - Entry-points
        - url
        - screenshot
        - fff
        - spiderparam
        - js
        - [url.sh]          url.sh  <host>
        - [waybackurl]      URL enumeration
        - [katana]          Host enumeration    
        - ZAP
        - Burp Suite
    - Framework/CMS
        - Name / Version
            - HTTP headers                      
                - X-Powered-By: Mono
                - X-Generator: Swiftlet
            - Cookies
                - CAKEPHP=rm72kprivgmau5fmjdesbuqi71
            - HTML source code
            - Specific files and folders
            - :code:`whatweb -v -a 3 https://$TARGET --log-verbose=whatweb --color=never    # https://morningstarsecurity.com/research/whatweb`
            - Wappalyzer                                                             # wappalyzer_varonis-com
            - https://whatcms.org/?s=www.example.com
            - Cookies
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
            - default  credentials
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
        - File Extensions        
            - .sql, .zip, .bak, .pdf, .txt, .old, .inf, .inc
        - Backup
            - js comment
            - js source code
            - cache file
            - .sql
            - .data
            - .bak
        - Admin panel
        - Identity managemnet
            - Admin
            - User
            - Subscriber
    - source
        - comment
        - HTML version
        - <meta tag>
    - Reverse proxy
    - Cloud storage
        - aws
        - gcloud
        - azure
    - Architecture
        - PaaS              
            - aws, azure, wordpress, wix, 
        - Entrypoints
            - Login
            - URL
            - Form
            - Admin panel
            - User panel
        - API
        - js library
        - Database
        - Cookie
        - Source code
            - Programming Language
            - github
        - Session
            - JWT
            - SessionId
        - Third party services/APIs
            - apikey
        - Application paths
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

**iOS Mobile app**
===================
- ...to be completed.

**Android Mobile app**
=======================
- ...to be completed.

**CIDR**
=========
- ...to be completed.

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
