FROM mewlody/steamcmd

MAINTAINER hi@mewlody.com

EXPOSE 16261/udp

USER root

WORKDIR /root

RUN apt-get update && apt-get -y install expect && apt-get -y upgrade && apt-get -y autoremove && apt-get clean

RUN steamcmd +force_install_dir /root/ZomboidServer +login anonymous +app_update 380870 validate +quit

RUN echo "#! /usr/bin/expect\n\
\n\
set timeout -1\n\
\n\
spawn /root/ZomboidServer/start-server.sh\n\
\n\
expect \"Enter new administrator password:\"\n\
send \"\$env(PASSWORD)\\\n\"\n\
\n\
expect \"Confirm the password:\"\n\
send \"\$env(PASSWORD)\\\n\"\n\
\n\
expect eof\n\
exit\n\
" > /root/start.exp

CMD ["/bin/bash", "-c", "expect /root/start.exp"]