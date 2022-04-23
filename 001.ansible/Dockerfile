FROM ubuntu:22.04

MAINTAINER hi@mewlody.com

USER root

WORKDIR /root

RUN apt-get update && apt-get -y upgrade \
    && apt-get install -y ansible \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -y autoremove && apt-get clean

ENTRYPOINT ["ansible"]

CMD ["--version"]