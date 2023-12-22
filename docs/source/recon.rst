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
- Website-info
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

.. csv-table::
   :file: key-persons.csv
   :widths: 20, 20, 20, 20, 20
   :header-rows: 1

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

.. csv-table::
   :file: partners.csv
   :widths: 30, 30, 30
   :header-rows: 1

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

Wildcard
------------

.. note::
    For each wildcard in scope, find subdomains, and hosts.

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
    export $IP=x.x.x.x

- Network
    - IP
        - [host] :code:`host $TARGET > ip`
        - [Original-ip]     https://securitytrails.com
        - [Original-ip]     https://zoomeye.org
    - IP.Reverse
        - :code:`wget https://api.hackertarget.com/reverseiplookup/?q=$IP > ip.reverse`
    - DNS
        - [traceroute]
        - [nslookup]
        - [dnsrecon]
        - [`dnsdumpster <https://dnsdumpster.com/>`_]
        - [`dnsleaktest <https://dnsleaktest.com/>`_]
        - [DNSenum]
        - [dig.sh]
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
        - [`shodan <https://shodan.io/dashboard/>`_ ]
        - [`censys <https://search.censys.io/>`_ ]
        - [`zoomeye <https://www.zoomeye.org/>`_ ]
        - [nmap]
        - [portip.sh]
- Services

.. csv-table::
   :file: services.csv
   :widths: 30, 30, 30, 70
   :header-rows: 1

Check out the :doc:`services` section for further information,

- ...to be completed.

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
        - [`securityheaders <https://securityheaders.com/>`_]
    - URLs
        - url
        - screenshot
        - fff
        - [url.sh]          url.sh  <host>
        - [waybackurl]      URL enumeration
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
    - [weleakinfo.io]   Info                               https://weleakinfo.io/
    - [hunter.io]       Info                               https://hunter.io/
    - 

iOS Mobile app
---------------
- ...to be completed.

Android Mobile app
-------------------
- ...to be completed.

CIDR
------------
- ...to be completed.

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
