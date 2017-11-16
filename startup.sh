#!/bin/bash

set -e

if [ -f /etc/configured ]; then
        echo 'already configured'
else
      #code that need to run only one time ....
      
        #to fix problem with data.timezone that appear at 1.28.108 for some reason
        echo $TZ > /etc/timezone
        sed  -i "s|\;date.timezone =|date.timezone = \"${TZ:-America/New_York}\"|" /etc/php/7.0/apache2/php.ini
      
        #needed for fix problem with ubuntu and cron
        update-locale 
        date > /etc/configured
fi
