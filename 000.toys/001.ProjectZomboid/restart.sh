#!/bin/bash

docker stop $(docker ps -aqf ancestor=mewlody/project-zomboid-server)

sh $(dirname $0)/clean.sh

docker start $(docker ps -aqf ancestor=mewlody/project-zomboid-server)

touch ./Zomboid/server-console.txt

tail -f ./Zomboid/server-console.txt