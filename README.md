docker-cacti
============

docker container with cacti

to run it 

docker run -d -p 80 -p 161:161 quantumobject/docker-cacti

check the port for it and check browser at http://host:port/cacti/

for configuration :

docker exec -it container_id /bin/bash   ==> to access the container ...

