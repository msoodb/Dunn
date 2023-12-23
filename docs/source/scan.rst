=====
Scan
=====

Once all the relevant data has been gathered in the reconnaissance phase, 
it’s time to move on to scanning. In this penetration testing phase, 
the tester uses various tools to identify open ports and check network 
traffic on the target system. Because open ports are potential entry points for attackers, 
penetration testers need to identify as many open ports as possible for the next penetration testing phase.

This step can also be performed outside of penetration testing; in those cases, 
it’s referred to simply as vulnerability scanning and is usually an automated process. 
However, there are drawbacks to only performing a scan without a full penetration test—namely, 
scanning can identify a potential threat but cannot determine the level at which 
hackers can gain access (Agio, 2022). So, while scanning is essential for cybersecurity, 
it also needs human intervention in the form of penetration testers to reach its full potential. 

Analyze urls
----------------
- URLs
    - :code:`gf [awskey | base64 | json-sec | idor]`
- Subdomain Takover
    - :code:`subzy run --target urls`
- Broken Link Hijacking, BLH
    - :code:`socialhunter -f urls`

Auto Scan
----------------
- General
    - :code:`nuclei -u https://$TARGET  -nc -o nuclei`
    - :code:`nikto -h https://$TARGET -o nikto.output -Format txt`
    - :code:`nmap $TARGET`
- Wordpress
    - :code:`wpscan --url https://$TARGET --random-user-agent --wp-content-dir -e --output wpscan.token --format cli-no-color --api-token $WP_TOKEN`
    - :code:`POST https://press.priceline.com/xmlrpc.php`
- Joomla
    - :code:`joomscan -u https://$TARGET`

-----

.. note::
    Scan phase designed based on WSTG OWASP Test Guide.

**Information**
=================
Information gathered in reconnaissance phase.
- Company
- Network
- Web Server
- Web Application


**Configuration and Deploy**
=============================

Defaults
-----------
Test all defaluts information which gathered in reconnaissance phase.
    - known vulnerabilities
        - [metasploit]
        - [nmap]
        - [exploit-db]
        - [wpscan]
    - default credentials
        - [Browser]
        - [curl]
        - [hydra]
    - default settings
    - defaults and known files

Configuration
--------------
Test all Configuration which gathered in reconnaissance phase.


**Identity Management**
=========================

Configuration
--------------
Test all Configuration which gathered in reconnaissance phase.

**Authentication**
===================

Configuration
--------------
Test all Configuration which gathered in reconnaissance phase.

**Authorization**
===================

Configuration
--------------
Test all Configuration which gathered in reconnaissance phase.

**Session**
===================

Configuration
--------------
Test all Configuration which gathered in reconnaissance phase.

**Data Validation**
===================

Configuration
--------------
Test all Configuration which gathered in reconnaissance phase.

**Error Handling**
===================

Configuration
--------------
Test all Configuration which gathered in reconnaissance phase.

**Cryptography**
===================

Configuration
--------------
Test all Configuration which gathered in reconnaissance phase.

**Business Logic**
===================

Configuration
--------------
Test all Configuration which gathered in reconnaissance phase.

**Client Side**
===================

Configuration
--------------
Test all Configuration which gathered in reconnaissance phase.

-----
end of scan.
