#!/bin/bash

/usr/bin/mysqld_safe &
 sleep 10s

if [ "$(mysqladmin -u root password mysqlpsswd)" = "" ]; then

 mysqladmin -u root -pmysqlpsswd reload
 mysqladmin -u root -pmysqlpsswd create cacti
 mysql -u root -pmysqlpsswd cacti < /usr/share/cacti/conf_templates/cacti.sql

 echo "GRANT ALL ON cacti.* TO cacti@localhost IDENTIFIED BY '9PIu8AbWQSf8'; flush privileges; " | mysql -u root -pmysqlpsswd 

fi

killall mysqld
sleep 10s

supervisord
