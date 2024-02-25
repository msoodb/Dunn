=====
Test
=====

Once all the relevant data has been gathered in the reconnaissance phase, 
it’s time to move on to Testing. In this penetration testing phase, 
the tester uses various tools to identify open ports and check network 
traffic on the target system. Because open ports are potential entry points for attackers, 
penetration testers need to identify as many open ports as possible for the next penetration testing phase.

This step can also be performed outside of penetration testing; in those cases, 
it’s referred to simply as vulnerability scanning and is usually an automated process. 
However, there are drawbacks to only performing a scan without a full penetration test—namely, 
scanning can identify a potential threat but cannot determine the level at which 
hackers can gain access (Agio, 2022). So, while scanning is essential for cybersecurity, 
it also needs human intervention in the form of penetration testers to reach its full potential. 

In the **recon** and **scan** phases we just gathered information as much as we can, about:

**Company** --> **Network map** --> **Live hosts** --> **Webserver** --> **Web-applications**

-----

.. note::
    Test phase designed based on WSTG OWASP Test Guide.

**Information Gathering**
===========================
* WSTG-INFO-01: Conduct Search Engine Discovery Reconnaissance for Information Leakage
* WSTG-INFO-02: Fingerprint Web Server
* WSTG-INFO-03: Review Webserver Metafiles for Information Leakage
* WSTG-INFO-04: Enumerate Applications on Webserver
* WSTG-INFO-05: Review Webpage Content for Information Leakage
* WSTG-INFO-06: Identify Application Entry Points
* WSTG-INFO-07: Map Execution Paths Through Application
* WSTG-INFO-08: Fingerprint Web Application Framework
* WSTG-INFO-10: Map Application Architecture

**Configuration and Deployment Management Testing**
=====================================================
* WSTG-CONF-01: Test Network Infrastructure Configuration
    - Test Known Infrastructure Vulnerabilities founded in recon phase.
    - Test Administrative Tools
    - Test any other vulnerability found in **Infrastructure** recon phase
    - Scan suspicious asset in Infrastructure and find new vulnerability.
* WSTG-CONF-02: Test Application Platform Configuration
    - Test known Application Platform vulnerabilities
    - Test any Defaults found in recon phase        
        - default credentials
        - default settings
        - defaults and known files
            1. Ensure that defaults and known files have been removed.
    - Environments
        1. Looking for debugging code or extensions are left in the production environments.
    - Logging
        1. Looking for any Sensitive Information
    - Test any other vulnerability found in **Web application** recon phase
* WSTG-CONF-03: Test File Extensions Handling for Sensitive Information
    - Dirbust sensitive file extensions
        1. looking for raw data (e.g. scripts, raw data, credentials, etc.)
        2. searching in .well-known
    - Test File Upload in any suspicious place
        1. file.phtml gets processed as PHP code.
        2. FILE~1.PHT is served, but not processed by the PHP ISAPI handler.
        3. shell.phPWND can be uploaded.
        4. SHELL~1.PHP will be expanded and returned by the OS shell, then processed by the PHP ISAPI handler.
    - Test for any system framework bypasses
* WSTG-CONF-04: Review Old Backup and Unreferenced Files for Sensitive Information
    - Test Unreferenced Files found in **Web application** recon phase
    - Looking Unreferenced Files in any js, html file.
    - Looking in /robots.txt
    - Blind Guessing
* WSTG-CONF-05: Enumerate Infrastructure and Application Admin Interfaces
    - Identify hidden administrator interfaces.    
    - Directory and file enumeration, comments and links in source 
        - /admin, /administrator, /backoffice, /backend, etc, 
        - alternative server port Tomcat/8080
    - Test administrator functionality.
* WSTG-CONF-06: Test HTTP Methods
    - Discover the Supported Methods
        - :code:`nmap -p 443 --script http-methods --script-args http-methods.url-path='/index.php' localhost`
        - Burpsuite Intruder
    - Testing for Access Control Bypass
        - ?
    - Testing for Cross-Site Tracing Potential - XST
        - ?
    - Testing for HTTP Method Overriding
        - ?
* WSTG-CONF-07: Test HTTP Strict Transport Security
    - Review the HSTS header and its validity.
    - :code:`curl -s -D- https://owasp.org | grep -i strict`
* WSTG-CONF-08: Test RIA Cross Domain Policy
    - Rich Internet Applications - RIA
    - Review and validate the policy files.
        - /crossdomain.xml
        - /clientaccesspolicy.xml
    - Testing for RIA Policy Files Weakness
    - Impact of Abusing Cross-Domain Access
        - Defeat CSRF protections.
        - Read data restricted or otherwise protected by cross-origin policies
* WSTG-CONF-09: Test File Permission
    - Review and identify any rogue file permissions.
        - Web files/directory
        - Configuration files/directory
        - Sensitive files (encrypted data, password, key)/directory
        - Log files (security logs, operation logs, admin logs)/directory
        - Executables (scripts, EXE, JAR, class, PHP, ASP)/directory
        - Database files/directory
        - Temp files /directory
        - Upload files/directory
* WSTG-CONF-10: Test for Subdomain Takeover
    - Enumerate all possible domains (previous and current).
    - Identify forgotten or misconfigured domains.
    - :code:`subzy run --target urls`
    - GitHub
    - Expired Domain
* WSTG-CONF-11: Test Cloud Storage
    - Identify the URL to access the data in the storage service
        - read the unauthorized data :code:`curl -X GET https://<cloud-storage-service>/<object>`
        - upload a new arbitrary file :code:`curl -X PUT -d 'test' 'https://<cloud-storage-service>/test.txt'`
    - Testing for Amazon S3 Bucket Misconfiguration

**Identity Management Testing**
=================================
* WSTG-IDNT-01: Test Role Definitions
    - Roles Identification
    - Switching to Available Roles
    - Review Roles Permissions
* WSTG-IDNT-02: Test User Registration Process
    1. Can anyone register for access?
    2. Are registrations vetted by a human prior to provisioning, or are they automatically granted if the criteria are met?
    3. Can the same person or identity register multiple times?
    4. Can users register for different roles or permissions?
    5. What proof of identity is required for a registration to be successful?
    6. Are registered identities verified?
    Validate the registration process:
        1. Can identity information be easily forged or faked?
        2. Can the exchange of identity information be manipulated during registration?
* WSTG-IDNT-03: Test Account Provisioning Process
    - The provisioning of accounts presents an opportunity for an attacker to create a valid account without application of the
       proper identification and authorization process.
    - Verify which accounts may provision other accounts and of what type.
* WSTG-IDNT-04: Testing for Account Enumeration and Guessable User Account
    - Testing for Valid Credentials
    - Testing for Valid User with Wrong Password
    - Testing for a Nonexistent Username
    - Analyzing the Error Code Received on Login Pages
    - Analyzing URLs and URLs Re-directions
    - URI Probing
        - 403 Forbidden error code
        - 404 Not found error code
    - Analyzing Web Page Titles
    - Friendly 404 Error Message
    - Analyzing Response Times
    - Testing for Authentication Error Messages
* WSTG-IDNT-05:Testing for Weak or Unenforced Username Policy
    - Determine the structure of account names.
    - Evaluate the application’s response to valid and invalid account names.
    - Use different responses to valid and invalid account names to enumerate valid account names.
    - Use account name dictionaries to enumerate valid account names

**Authentication Testing**
===========================
* WSTG-ATHN-1: Testing for Credentials Transported over an Encrypted Channel
    - Disable any features or plugins that make the web browser favour HTTPS
    - Set up and start a tool to capture traffic
        - Passphrases or passwords, usually inside a message body
        - Tokens, usually inside cookies
    - For any message containing this sensitive data, verify the exchange occurred using HTTPS (and not HTTP)
        - Login
        - Account Creation
        - Password Reset, Change Password or Other Account Manipulation
        - Accessing Resources While Logged In
        - Account or password reset codes
* WSTG-ATHN-2: Testing for Default Credentials
    - Testing for Default Credentials of Common Applications
    - Testing for Default Password of New Accounts
* WSTG-ATHN-3: Testing for Weak Lock Out Mechanism
    - Test Lockout Mechanism
    - Test CAPTCHA
    - Test Unlock Mechanism
* WSTG-ATHN-4: Testing for Bypassing Authentication Schema
    - Direct Page Request
    - Parameter Modification
    - Session ID Prediction
    - SQL Injection (HTML Form Authentication)
* WSTG-ATHN-5: Testing for Vulnerable Remember Password
    - Validate that the generated session is managed securely and do not put the user’s credentials in danger
* WSTG-ATHN-6: Testing for Browser Cache Weaknesses
    - Browser History
    - Browser Cache
    - Reviewing Cached Information
    - Check Handling for Mobile Browsers
* WSTG-ATHN-7: Testing for Weak Password Policy
    - brute force 
    - password guessing 
    - using available password dictionaries by evaluating the length, complexity, reuse, and aging requirements of passwords.
* WSTG-ATHN-8: Testing for Weak Security Question Answer
    - Testing for Weak Pre-generated Questions
    - Testing for Weak Self-Generated Questions
    - Testing for Brute-forcible Answers
* WSTG-ATHN-9: Testing for Weak Password Change or Reset Functionalities
    - Test Password Reset
    - Test Password Change
* WSTG-ATHN-10: Testing for Weaker Authentication in Alternative Channel
    - Understand the Primary Mechanism
    - Identify Other Channels
    - Enumerate Authentication Functionality

**Authorization Testing**
=========================
* WSTG-ATHZ-01: Testing Directory Traversal File Include
    - Input Vectors Enumeration
    - Testing Techniques
    - Looking for :code:`../../../../etc/passwd`
        - URL: http://example.com/getUserProfile.jsp?item=../../../../etc/passwd
        - URL: http://example.com/index.php?file=http://www.owasp.org/malicioustxt
        - URL: http://example.com/index.php?file=file:///etc/passwd
        - Cookie: USER=1826cc8f:PSTYLE=../../../../etc/passwd
    - Code
        - PHP: include(), include_once(), require(), require_once(), fopen(), readfile(), ...
            - (include|require)(_once)?\s*['"(]?\s*\$_(GET|POST|COOKIE)
        - JSP/Servlet: java.io.File(), java.io.FileReader(), ...
        - ASP: include file, include virtual, ...
* WSTG-ATHZ-02: Testing for Bypassing Authorization Schema
    - Testing for Horizontal Bypassing Authorization Schema
    - Testing for Vertical Bypassing Authorization Schema
    - Banking Site Roles Scenario
    - Administrator Page Access
        - Testing for Access to Administrative Functions
        - Testing for Access to Resources Assigned to a Different Role
        - Testing for Special Request Header Handling
            1. Send a Normal Request without Any X-Original-Url or X-Rewrite-Url Header
            2. Send a Request with an X-Original-Url Header Pointing to a Non-Existing Resource
            3. Send a Request with an X-Rewrite-Url Header Pointing to a Non-Existing Resource
            4. Other Headers to Consider
                - X-Forwarded-For
                - X-Forward-For
                - X-Remote-IP
                - X-Originating-IP
                - X-Remote-Addr
                - X-Client-IP
* WSTG-ATHZ-03: Testing for Privilege Escalation
    - Objectives
        - Identify injection points related to privilege manipulation.
        - Fuzz or otherwise attempt to bypass security measures.
    - Testing for Role/Privilege Manipulation
        1. Manipulation of User Group
        2. Manipulation of User Profile
        3. Manipulation of Condition Value
        4. Manipulation of IP Address
            - X-Forwarded-For: 8.1.1.1
    - URL Traversal
        1. /../.././userInfo.html
    - Code
        1. startswith(), endswith(), contains(), indexOf()
    - SessionID
        1. decrypt
        2. manipulate
* WSTG-ATHZ-04: Testing for Insecure Direct Object References - IDOR
    - Identify points where object references may occur.
    - Assess the access control measures and if they’re vulnerable to IDOR.
        - The Value of a Parameter Is Used Directly to Retrieve a Database Record
        - The Value of a Parameter Is Used Directly to Perform an Operation in the System
        - The Value of a Parameter Is Used Directly to Retrieve a File System Resource
        - The Value of a Parameter Is Used Directly to Access Application Functionality

**Session Management Testing**
================================
* WSTG-SESS-01: Testing for Session Management Schema
    - Gather session tokens
    - Analyze
    - Modify cookies
* WSTG-SESS-02: Testing for Cookies Attributes
    - Secure Attribute
    - HttpOnly Attribute
    - Domain Attribute
    - Path Attribute
    - Expires Attribute
    - SameSite Attribute
* WSTG-SESS-03: Testing for Session Fixation
    - Analyze the authentication mechanism and its flow.
    - Force cookies and assess the impact.
* WSTG-SESS-04: Testing for Exposed Session Variables
    - Testing for Encryption & Reuse of Session Tokens Vulnerabilities
    - Testing for Proxies & Caching Vulnerabilities
    - Testing for GET & POST Vulnerabilities
    - Testing for Transport Vulnerabilities
* WSTG-SESS-05: Testing for Cross Site Request Forgery - CSRF
    - https://cheatsheetseries.owasp.org/cheatsheets/Cross-Site_Request_Forgery_Prevention_Cheat_Sheet.html
* WSTG-SESS-06: Testing for Logout Functionality
    - Testing for Log Out User Interface
    - Testing for Server-Side Session Termination
    - Testing for Session Timeout
    - Testing for Session Termination in Single Sign-On Environments (Single Sign-Off)
* WSTG-SESS-07: Testing Session Timeout
    - Validate that a hard session timeout exists
* WSTG-SESS-08: Testing for Session Puzzling
    - Identify all session variables.
    - Break the logical flow of session generation.
* WSTG-SESS-09: Testing for Session Hijacking
    - Identify vulnerable session cookies.
    - Hijack vulnerable cookies and assess the risk level.

**Input Validation Testing**
=============================
* WSTG-INPV-1: Testing for Reflected Cross Site Scripting - XSS
* WSTG-INPV-2: Testing for Stored Cross Site Scripting - Stored XSS
* WSTG-INPV-3: Testing for HTTP Parameter Pollution
* WSTG-INPV-4: Testing for SQL Injection - SQLi
* WSTG-INPV-5: Testing for LDAP Injection
* WSTG-INPV-6: Testing for XML Injection
* WSTG-INPV-7: Testing for SSI Injection
* WSTG-INPV-8: Testing for XPath Injection
* WSTG-INPV-9: Testing for IMAP SMTP Injection
* WSTG-INPV-10: Testing for Code Injection
* WSTG-INPV-11: Testing for Command Injection
* WSTG-INPV-13: Testing for Format String Injection
* WSTG-INPV-14: Testing for Incubated Vulnerability
* WSTG-INPV-15: Testing for HTTP Splitting Smuggling
* WSTG-INPV-16: Testing for HTTP Incoming Requests
* WSTG-INPV-17: Testing for Host Header Injection
* WSTG-INPV-18: Testing for Server-side Template Injection
* WSTG-INPV-19: Testing for Server-Side Request Forgery - SSRF

**Testing for Error Handling**
===============================
* WSTG-ERRH-01: Testing for Improper Error Handling
    - Identify existing error output.        
    - Analyze the different output returned.
    - Test
        - Web Servers
        - Applications

**Testing for Weak Cryptography**
==================================
* WSTG-CRYP-01: Testing for Weak Transport Layer Security    
    - Automated Testing
        - Nmap (various scripts)
        - OWASP O-Saft
        - sslscan
        - sslyze
        - SSL Labs
        - testssl.sh
    - Manual Testing
        - openssl
        - gnutls-cli
* WSTG-CRYP-02: Testing for Padding Oracle
    - Identify encrypted messages that rely on padding.
    - Attempt to break the padding of the encrypted messages and analyze the returned error messages for further analysis.
* WSTG-CRYP-03: Testing for Sensitive Information Sent via Unencrypted Channels
    - Basic Authentication over HTTP
    - Form-Based Authentication Performed over HTTP
    - Cookie Containing Session ID Sent over HTTP
    - Testing Password Sensitive Information in Source Code or Logs
        - :code:`grep -r –E "Pass | password | pwd |user | guest| admin | encry | key | decrypt | sharekey "./PathToSearch/`
        - :code:`grep -r " {2\}[0-9]\{6\} " ./PathToSearch/`
* WSTG-CRYP-04: Testing for Weak Encryption
    - Provide a guideline for the identification weak encryption or hashing uses and implementations.

**Business Logic Testing**
============================
* WSTG-BUSL-01: Test Business Logic Data Validation
* WSTG-BUSL-02: Test Ability to Forge Requests
* WSTG-BUSL-03: Test Integrity Checks
* WSTG-BUSL-04: Test for Process Timing
* WSTG-BUSL-05: Test Number of Times a Function Can Be Used Limits
* WSTG-BUSL-06: Testing for the Circumvention of Work Flows
* WSTG-BUSL-07: Test Defenses Against Application Misuse
* WSTG-BUSL-08: Test Upload of Unexpected File Types
* WSTG-BUSL-09: Test Upload of Malicious Files

**Client-side Testing**
=========================
* WSTG-CLNT-01: Testing for DOM-Based Cross Site Scripting - XSS
* WSTG-CLNT-02: Testing for JavaScript Execution
* WSTG-CLNT-03: Testing for HTML Injection
* WSTG-CLNT-04: Testing for Client-side URL Redirect
* WSTG-CLNT-05: Testing for CSS Injection
* WSTG-CLNT-06: Testing for Client-side Resource Manipulation
* WSTG-CLNT-07: Testing Cross Origin Resource Sharing - CORS
* WSTG-CLNT-08: Testing for Cross Site Flashing - XSF
* WSTG-CLNT-09: Testing for Clickjacking
* WSTG-CLNT-10: Testing WebSockets
* WSTG-CLNT-11: Testing Web Messaging
* WSTG-CLNT-12: Testing Browser Storage
* WSTG-CLNT-13: Testing for Cross Site Script Inclusion - XSSI

**API Testing**
==================
* WSTG-APIT-01: Testing GraphQL