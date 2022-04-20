#!/bin/bash

cp -r ./Zomboid ./Zomboid.bak

ls -d ./Zomboid/* | \
    grep -v Saves | \
    grep -v Server | \
    grep -v db | \
    xargs rm -rf

ls -d ./Zomboid/Saves/Multiplayer/servertest/* | \
    grep -v players.db | \
    grep -v vehicles.db | \
    grep -v WorldDictionary | \
    grep -v isoregiondata | \
    grep -vE "\w*_105[2-8]_97[^0-3]" | \
    xargs rm -rf

ls -d ./Zomboid/Saves/Multiplayer/servertest/isoregiondata/* | \
    grep -v RegionHeader.bin | \
    grep -vE "\w*_105[2-8]_97[^0-3]" | \
    xargs rm -rf
