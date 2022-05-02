FROM golang:1.16-alpine3.13

RUN wget https://github.com/cli/cli/releases/download/v2.9.0/gh_2.9.0_linux_386.tar.gz -O ghcli.tar.gz
RUN tar --strip-components=1 -xf ghcli.tar.gz
RUN apk update && \
    apk upgrade && \
    apk add build-base && \
    apk add git

RUN mv ./bin/gh /usr/local/bin/

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
