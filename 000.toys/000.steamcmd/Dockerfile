FROM ubuntu:22.04

MAINTAINER hi@mewlody.com

USER root

WORKDIR /root

RUN dpkg --add-architecture i386 \
    && apt-get update && apt-get -y upgrade \
    && apt-get install -y lib32stdc++6 lib32gcc1 libsdl2-2.0-0:i386 libsdl2-2.0-0 curl locales \
    && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -y autoremove && apt-get clean

RUN mkdir Steam && cd Steam \
    && curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -

RUN echo "#!/bin/sh \nexec /root/Steam/steamcmd.sh \$@" > /usr/local/bin/steamcmd && chmod +x /usr/local/bin/steamcmd

CMD ["/bin/bash", "-c", "steamcmd +help"]