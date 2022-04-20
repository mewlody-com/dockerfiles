#!/bin/bash

docker rm $(docker stop $(docker ps -aqf ancestor=mewlody/project-zomboid-server))

sh $(dirname $0)/clean.sh

docker run -itd --restart=always \
           -v /root/games/ProjectZomboid/Zomboid:/root/Zomboid \
           -v /root/games/ProjectZomboid/ZomboidServer/steamapps:/root/ZomboidServer/steamapps \
           -p 16261:16261/udp mewlody/project-zomboid-server

touch ./Zomboid/server-console.txt

tail -f ./Zomboid/server-console.txt
