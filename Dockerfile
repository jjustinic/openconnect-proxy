FROM ubuntu:18.04

RUN apt-get -qqy update && \
    apt-get -qqy install openconnect ocproxy polipo && \
    rm -rf /var/lib/apt/lists/*

ADD entrypoint.sh /docker/entrypoint.sh
RUN chmod +x /docker/entrypoint.sh

EXPOSE 8123

ENTRYPOINT ["/docker/entrypoint.sh"]
