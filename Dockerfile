FROM openjdk:17-slim

ENV MC_VERSION=1.17.1
ENV SRV_RAM=2G

WORKDIR /usr/src/papermc

COPY get-papermc.sh start.sh /tmp/

RUN apt-get update -qq && \
    apt-get install -qq curl jq > /dev/null 2>&1 && \
    apt-get clean

RUN useradd papermc
RUN chown -R papermc:papermc .
USER papermc

EXPOSE 25565/tcp
ENTRYPOINT [ "sh", "-c", "/tmp/get-papermc.sh && /tmp/start.sh" ]

VOLUME [ "/usr/src/papermc" ]
