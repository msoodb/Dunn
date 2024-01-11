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

In the **recon** phase we just gathered information as much as we can, about:

**Company** --> **Infrastructure** --> **Wildcard** --> **Domain**

Analyze urls
=================
- URLs
    - :code:`gf [awskey | base64 | json-sec | idor]`
- Subdomain Takover
    - :code:`subzy run --target urls`
- Broken Link Hijacking, BLH
    - :code:`socialhunter -f urls`

Auto Scan
=================
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

-----

.. note::
    Scan phase designed based on WSTG OWASP Test Guide.

**Information**
=================

* WSTG-INFO-01: Conduct Search Engine Discovery Reconnaissance for Information Leakage
* WSTG-INFO-02: Fingerprint Web Server
* WSTG-INFO-03: Review Webserver Metafiles for Information Leakage
* WSTG-INFO-04: Enumerate Applications on Webserver
* WSTG-INFO-05: Review Webpage Content for Information Leakage
* WSTG-INFO-06: Identify Application Entry Points
* WSTG-INFO-07: Map Execution Paths Through Application
* WSTG-INFO-08: Fingerprint Web Application Framework
* WSTG-INFO-09: Merged into WSTG-INFO-08
* WSTG-INFO-10: Map Application Architecture


**Configuration and Deploy**
=============================

* Test Network Infrastructure Configuration
* Test Application Platform Configuration
* Test File Extensions Handling for Sensitive Information
* Review Old Backup and Unreferenced Files for Sensitive Information
* Enumerate Infrastructure and Application Admin Interfaces
* Test HTTP Methods
* Test HTTP Strict Transport Security
* Test RIA Cross Domain Policy
* Test File Permission
* Test for Subdomain Takeover
* Test Cloud Storage
* Testing for Content Security Policy
* Test Path Confusion

**Identity Management**
=========================

* Test Role Definitions
* Test User Registration Process
* Test Account Provisioning Process
* Testing for Account Enumeration and Guessable User Account
* Testing for Weak or Unenforced Username Policy

**Authentication**
===================

* Testing for Credentials Transported over an Encrypted Channel
* Testing for Default Credentials
* Testing for Weak Lock Out Mechanism
* Testing for Bypassing Authentication Schema
* Testing for Vulnerable Remember Password
* Testing for Browser Cache Weaknesses
* Testing for Weak Password Policy
* Testing for Weak Security Question Answer
* Testing for Weak Password Change or Reset Functionalities
* Testing for Weaker Authentication in Alternative Channel
* Testing Multi-Factor Authentication (MFA)

**Authorization**
===================

* Testing Directory Traversal File Include
* Testing for Bypassing Authorization Schema
* Testing for Privilege Escalation
* Testing for Insecure Direct Object References
* Testing for OAuth Weaknesses

**Session**
===================

* Testing for Session Management Schema
* Testing for Cookies Attributes
* Testing for Session Fixation
* Testing for Exposed Session Variables
* Testing for Cross Site Request Forgery
* Testing for Logout Functionality
* Testing Session Timeout
* Testing for Session Puzzling
* Testing for Session Hijacking
* Testing JSON Web Tokens

**Data Validation**
===================

* Testing for Reflected Cross Site Scripting
* Testing for Stored Cross Site Scripting
* Testing for HTTP Verb Tampering
* Testing for HTTP Parameter Pollution
* Testing for SQL Injection
* Testing for LDAP Injection
* Testing for XML Injection
* Testing for SSI Injection
* Testing for XPath Injection
* Testing for IMAP SMTP Injection
* Testing for Code Injection
* Testing for Command Injection
* Testing for Format String Injection
* Testing for Incubated Vulnerability
* Testing for HTTP Splitting Smuggling
* Testing for HTTP Incoming Requests
* Testing for Host Header Injection
* Testing for Server-side Template Injection
* Testing for Server-Side Request Forgery
* Testing for Mass Assignment

**Error Handling**
===================

* Testing for Improper Error Handling
* Testing for Stack Traces

**Cryptography**
=================

* Testing for Weak Transport Layer Security
* Testing for Padding Oracle
* Testing for Sensitive Information Sent via Unencrypted Channels
* Testing for Weak Encryption

**Business Logic**
===================

* Test Business Logic Data Validation
* Test Ability to Forge Requests
* Test Integrity Checks
* Test for Process Timing
* Test Number of Times a Function Can Be Used Limits
* Testing for the Circumvention of Work Flows
* Test Defenses Against Application Misuse
* Test Upload of Unexpected File Types
* Test Upload of Malicious Files
* Test Payment Functionality

**Client Side**
===================

* Testing for DOM-Based Cross Site Scripting
* Testing for JavaScript Execution
* Testing for HTML Injection
* Testing for Client-side URL Redirect
* Testing for CSS Injection
* Testing for Client-side Resource Manipulation
* Testing Cross Origin Resource Sharing
* Testing for Cross Site Flashing
* Testing for Clickjacking
* Testing WebSockets
* Testing Web Messaging
* Testing Browser Storage
* Testing for Cross Site Script Inclusion
* Testing for Reverse Tabnabbing

