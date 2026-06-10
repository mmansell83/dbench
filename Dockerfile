# FROM dmonakhov/alpine-fio
FROM docker.io/library/alpine:3.24.0@sha256:8ddefa941e689fc29abcdeb8dae3b3c6d139cc08ce9a52633931160701770685

LABEL org.opencontainers.image.authors="lee@logdna.com,michael.mansell@gmail.com"

RUN apk add --no-cache fio

VOLUME /tmp
WORKDIR /tmp

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["fio"]
