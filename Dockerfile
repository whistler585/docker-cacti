# cacti container
# VERSION               0.0.4
FROM angelrr7702/ubuntu-13.10-sshd
MAINTAINER Angel Rodriguez  "angelrr7702@gmail.com"
RUN echo "deb http://archive.ubuntu.com/ubuntu saucy-backports main restricted " >> /etc/apt/sources.list

ENV DEBIAN_FRONTEND noninteractive

RUN (apt-get update && apt-get upgrade -y -q && apt-get dist-upgrade -y -q && apt-get -y -q autoclean && apt-get -y -q autoremove)
RUN apt-get install -y -q supervisor cacti snmpd cacti-spine

ADD start.sh /start.sh
ADD foreground.sh /etc/apache2/foreground.sh
ADD snmpd.conf /etc/snmp/snmpd.conf 
ADD cacti.conf /etc/dbconfig-common/cacti.conf
ADD debian.conf /etc/cacti/debian.php
ADD spine.conf /etc/cacti/spine.conf
ADD pre-conf.sh /pre-conf.sh

RUN (chmod 750 /start.sh && chmod 750 /etc/apache2/foreground.sh && chmod 750 /pre-conf.sh)
RUN (/bin/bash -c /pre-conf.sh)

RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 22 80 161
CMD ["/bin/bash", "-e", "/start.sh"] 
