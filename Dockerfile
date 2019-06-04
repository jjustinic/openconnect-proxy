FROM ubuntu:18.04

RUN apt-get -qqy update && \
    apt-get -qqy install openconnect ocproxy polipo

ADD entrypoint.sh /docker/entrypoint.sh

EXPOSE 8123

ENTRYPOINT ["/docker/entrypoint.sh"]
