# docker-cacti

Docker container for [cacti 0.8.8b][3]

"Cacti is a complete network graphing solution designed to harness the power of [RRDTool's][6] data storage and graphing functionality. Cacti provides a fast poller, advanced graph templating, multiple data acquisition methods, and user management features out of the box. All of this is wrapped in an intuitive, easy to use interface that makes sense for LAN-sized installations up to complex networks with hundreds of devices."

## Install dependencies

  - [Docker][2]

To install docker in Ubuntu 14.04 use the commands:

    $ sudo apt-get update
    $ wget -qO- https://get.docker.com/ | sh

 To install docker in other operating systems check [docker online documentation][4]

## Usage

To run container use the command below:

    $ docker run -d -p 80 -p 161:161 quantumobject/docker-cacti

## Accessing the Cacti applications:

After that check with your browser at addresses plus the port assigined by docker:

  - **http://host_ip:port/cacti/**

Them you can log-in admin/admin, Please change the password.

## To install plugins on cacti :

To access the container from the server that the container is running

     $ docker exec -it container_id /bin/bash

change directory to plugins directory of the cacti ubuntu

     $ cd /usr/share/cacti/site/plugins/

download and unpack plugins

     $ wget wget http://docs.cacti.net/_media/plugin:flowview-v1.1-1.tgz
     $ gunzip -c plugin\:flowview-v1.1-1.tgz | tar xvf -
     $ mkdir -p /var/netflow/flows/completed
     $ chmod 777 /var/netflow/flows/completed

and them access to cacti console/plugin management and install it and enable it. This is only for an example, to install and configured flowview you need to check its documentation of the complete procedure for ubuntu.  

## More Info

About Cacti [www.cacti.net][1]

To help improve this container [quantumobject/docker-cacti][5]

[1]:http://www.cacti.net/
[2]:https://www.docker.com
[3]:http://www.cacti.net/release_notes_0_8_8b.php
[4]:http://docs.docker.com
[5]:https://github.com/QuantumObject/docker-cacti
[6]:http://oss.oetiker.ch/rrdtool
