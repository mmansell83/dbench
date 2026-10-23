# FROM dmonakhov/alpine-fio
FROM docker.io/library/alpine:3.24.3@sha256:be2656061b536c1883c4034790e21d0a09c5aaaf51968b89368a3c0371ea2c9a

LABEL org.opencontainers.image.authors="lee@logdna.com,michael.mansell@gmail.com"

RUN apk add --no-cache fio

VOLUME /tmp
WORKDIR /tmp

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["fio"]
