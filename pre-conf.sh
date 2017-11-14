#!/bin/bash

/usr/bin/mysqld_safe &
 
mkdir /opt/logs
touch /opt/logs/cacti.log
touch /opt/logs/httpd_access.log
touch /opt/logs/httpd_error.log
chown -R www-data /opt/logs/*

 mysqladmin -u root password mysqlpsswd
 mysqladmin -u root -pmysqlpsswd reload
 mysqladmin -u root -pmysqlpsswd create cacti
 mysql -u root -pmysqlpsswd cacti < /opt/cacti/cacti.sql
 
 mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -u root -pmysqlpsswd mysql

 echo "GRANT ALL ON cacti.* TO cacti@localhost IDENTIFIED BY '9PIu8AbWQSf8'; flush privileges; " | mysql -u root -pmysqlpsswd 
 echo "GRANT SELECT ON mysql.time_zone_name TO cacti@localhost IDENTIFIED BY '9PIu8AbWQSf8'; flush privileges; " | mysql -u root -pmysqlpsswd 

 rm -R /var/www/html
 
 #to fix error relate to ip address of container apache2
 echo "ServerName localhost" | tee /etc/apache2/conf-available/fqdn.conf
 ln -s /etc/apache2/conf-available/fqdn.conf /etc/apache2/conf-enabled/fqdn.conf
 
 # to set correct webroot for cacti (inplace edit of default apache2 site conf)
 perl -pi -e's@/var/www/html@/usr/share/cacti/site@g' /etc/apache2/sites-enabled/000-default.conf

killall mysqld
sleep 10s
