FROM ruby:3.1.2-alpine

RUN set -xe; \
    apk add --no-cache \
        libstdc++ \
        sqlite-libs; \
    apk add --no-cache --virtual .build-deps \
        build-base \
        sqlite-dev; \
    gem install mailcatcher -v 0.8.2; \
    apk del .build-deps

# smtp port
EXPOSE 1025

# webserver port
EXPOSE 1080

CMD ["mailcatcher", "--no-quit", "--foreground", "--ip=0.0.0.0"]