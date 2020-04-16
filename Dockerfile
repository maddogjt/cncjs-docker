FROM node:12-alpine
MAINTAINER Jason Tranchida <jtranchida@gmail.com>

ARG VERSION=latest

RUN apk --no-cache add udev

RUN apk add --no-cache --virtual build-deps \
        gcc g++ make musl-dev python3 linux-headers \
    && npm install -g cncjs@$VERSION --unsafe \
    && apk del build-deps

VOLUME /cncjs

ENV CNCJS_CONTROLLER=
ENV CNCJS_ADDITIONAL_ARGUMENTS=

EXPOSE 8000
CMD ["/usr/local/bin/cncjs", \
    "--port", "8000", \
    "--config", "/cncjs/.cncrc", \
    "--watch-directory", "/cncjs/watch/", \
    "--controller", \
    "\"${CNCJS_CONTROLLER}\"" ]