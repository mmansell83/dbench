# FROM dmonakhov/alpine-fio
FROM docker.io/library/alpine:3.24.0@sha256:a2d49ea686c2adfe3c992e47dc3b5e7fa6e6b5055609400dc2acaeb241c829f4

LABEL org.opencontainers.image.authors="lee@logdna.com,michael.mansell@gmail.com"

RUN apk add --no-cache fio

VOLUME /tmp
WORKDIR /tmp

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["fio"]
