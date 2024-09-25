# FROM dmonakhov/alpine-fio
FROM docker.io/library/alpine:3.20.3@sha256:a8f120106f5549715aa966fd7cefaf3b7045f6414fed428684de62fec8c2ca4b

LABEL org.opencontainers.image.authors="lee@logdna.com,michael.mansell@gmail.com"

RUN apk add --no-cache fio

VOLUME /tmp
WORKDIR /tmp

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["fio"]
