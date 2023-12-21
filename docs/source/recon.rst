Recon
=====

Company
------------

.. list-table::
   :widths: 25 75

   * - Name
     -
   * - Website
     - 
   * - Brands
     -   

- History
- Leaked-info
    - Document
        - `Dunn <https://github.com/msoodb/dunn/>`_ . site:example.com filetype:pdf inurl:login cache:example.com
    - User:Email:Password
        [rocketreach] email and phone
        [pastebin] leaked password
        [haveibeenpwned] password reuse attack
        SocialMedia
            - Linkedin
            - Instagram
            - facebook
    - Source-code
        - [github] code, api-key and data leak
    - Server:IP:Port
        - [shodan] servers and ports
        - [censys] servers and ports
        - [zoomeye] servers and ports
    - Other tools
        - Google Hacking Database            https://www.exploit-db.com/google-hacking-database
        - search engine
            - [Baidu]
            - [binsearch.info]
            - [Bing]
            - [DuckDuckGo]
            - [ixquick/Startpage]
        - etc
            - [PunkSpider]
            - [Framework]       OSINT Framework                    https://osintframework.com
            - [theHarvester]    OSINT platform                     -
            - [rocketreach]     Email and phone                    https://rocketreach.co
            - [alerts]          Set google change alert            https://google.com/alerts
- Website
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
- key persons
    - Email
    - User:Pass    - 
    - Social media
    - Background
    - Leaked-info
- Business
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
- Partners
    - Name
    - Partnership
    - Info
- Infrastructure
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
    - api
        - BaseURL
        - Version
        - Document

Covenant
------------
- Bounty                 
    - type
    - platform
    - url
- Wildcards

.. code-block:: console
    
    *.example.com
    test*.example.com 

- Domains

.. code-block:: console
    
    api.gamma.example.com
    ftp.example.com 

- iOS mobile app

.. code-block:: console
    
    com.example.app

- Android mobile app

.. code-block:: console
    
    com.example.app

- CIDR

.. code-block:: console
    
    207.250.125.0/28
    167.104.0.0/16 

- Policy
    - Public Disclosure Policy
    - Test Plan
    - Program Rules
    - Legal
- Out of Scope

.. code-block:: console
    
    x.example.com
    *.x.example.com 

Wildcard
------------
- Subdomain
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
- Host
    - [host.sh]
    - [httprobe]
    - [httpx]
    - [fff]

Domain
------------

.. code-block:: console
    
    export $TARGET=www.example.com

- Network
    - IP
        - [host]  :code:`host $TARGET > ip`
    - IP.Reverse
        - :code:`https://api.hackertarget.com/reverseiplookup/?q=$IP > ip.reverse`
    - DNS
        - [traceroute]
        - [nslookup]
        - [dnsrecon]
        - [dnsdumpster] :code:`https://dnsdumpster.com`
        - [dnsleaktest] :code:`https://dnsleaktest.com`
        - [DNSenum]
        - [dig.sh]
    - Location
        - :code:`https://ip2location.com`
    - WAF
        - [wafw00f]  :code:` wafw00f $TARGET > waf`
        - [WAF-Detection] :code:`https://www.nmmapper.com/sys/reconnaissance-tools/waf/web-application-firewall-detector/ >> waf` 
        - [p0f] TCP/IP stack fingerprinting
    - IPS
    - Whois
        - [whois] :code:`whois $TARGET > whois`
    - Port
        - number
        - service
        - version
        - vulnerability
        - [shodan]
        - [censys]
        - [zoomeye]
        - [nmap]
        - [portip.sh]
- Services

.. list-table:: Title
   :widths: 25 25 50
   :header-rows: 1

   * - Heading row 1, column 1
     - Heading row 1, column 2
     - Heading row 1, column 3
   * - Row 1, column 1
     -
     - Row 1, column 3
   * - Row 2, column 1
     - Row 2, column 2
     - Row 2, column 3
     
.. csv-table:: Table Title
   :file: services.csv
   :widths: 30, 30, 30, 70
   :header-rows: 1

- Web server
    - type              
    - information leakage
    - version           
    - vulnerability
- Web application
    - information leakage
    - Metafiles
        - robots.txt
        - sitemap.xml
        - <meta tag>
    - Headers
        - HSTS
        - X-XSS-Protection
        - CORS
        - server
        - X-Powered-By
        - X-Frame-Options
        - Content-Security-Policy
    - URLs
        - url
        - screenshot
        - fff
        - [url.sh]          url.sh  <host>
        - [waybackurl]      URL enumeration                    -
        - [katana]          Host enumeration
    - spiderparam
    - js
    - Framework/CMS
        - name
        - version
        - default
            - known vulnerabilities
            - default  credentials
            - default settings
            - defaults and known files
        - configuration
        - database
        - environments
            - development
            - sandbox
            - production
        - logging
            - Location
            - Storage
            - Rotation
            - Access Control
            - Review
        - File Extensions        .sql, .zip, .bak, .pdf, .txt, .old, .inf, .inc
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
        - PaaS              aws, azure, wordpress, wix, 
        - Entrypoints
            - Login
            - URL
            - Form
            - Admin panel
            - User panel
        - api
        - js library
        - database
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
    - [securityheaders] Headers missing                    https://securityheaders.com
    - [weleakinfo.io]   Info                               https://weleakinfo.io/
    - [hunter.io]       Info                               https://hunter.io/
    - [Original-ip]     Find the real IP of websites       https://securitytrails.com, https://zoomeye.org

iOS Mobile app
---------------
- iOS Mobile app
- iOS Mobile app

Android Mobile app
-------------------
- Android Mobile app

CIDR
------------
- CIDR

Automated Reconnaissance Framework, and Vulnerability Repositories
------------------------------------------------------------------------
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
