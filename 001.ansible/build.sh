#!/bin/bash

docker build -t temp .

REMOTE_VERSION=$(docker run --rm mewlody/ansible --version| head -n 1 | awk '{print $2}')
CURRENT_VERSION=$(docker run --rm temp --version| head -n 1 | awk '{print $2}')

if [[ $CURRENT_VERSION != $REMOTE_VERSION ]]; then
    docker tag temp mewlody/ansible
    docker tag temp mewlody/ansible:$CURRENT_VERSION
    docker push mewlody/ansible:$CURRENT_VERSION && docker push mewlody/ansible
else
    echo "not update"
fi
