#!/bin/bash

# ----------------------------------
#   Common URLs Generate
# ----------------------------------

TARGET=$1

paths=(
'/robots.txt'
'/robots'
'/sitemap.xml'
'/admin'
'/admin-authz.xml'
'/admin.conf'
'/admin.passwd'
'/admin/*'
'/admin/logon.jsp'
'/admin/secure/logon.jsp'
'/phpinfo'
'/phpmyadmin/'
'/phpMyAdmin/'
'/mysqladmin/'
'/MySQLadmin'
'/MySQLAdmin'
'/login.php'
'/logon.php'
'/xmlrpc.php'
'/dbadmin'
'/admin.dll'
'/admin.exe'
'/administrators.pwd'
'/author.dll'
'/author.exe'
'/author.log'
'/authors.pwd'
'/cgi-bin'
'/AdminCaptureRootCA'
'/AdminClients'
'/AdminConnections'
'/AdminEvents'
'/AdminJDBC'
'/AdminLicense'
'/AdminMain'
'/AdminProps'
'/AdminRealm'
'/AdminThreads'
'/wp-admin/'
'/wp-admin/about.php'
'/wp-admin/admin-ajax.php'
'/wp-admin/admin-db.php'
'/wp-admin/admin-footer.php'
'/wp-admin/admin-functions.php'
'/wp-admin/admin-header.php'
'/mod'
'/backups'
)

pathslength=${#paths[@]};
for i in $(seq 0 $pathslength)
do
echo -e "$TARGET${paths[$i]}"
done