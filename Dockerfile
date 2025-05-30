# FROM dmonakhov/alpine-fio
FROM docker.io/library/alpine:3.22.0@sha256:8a1f59ffb675680d47db6337b49d22281a139e9d709335b492be023728e11715

LABEL org.opencontainers.image.authors="lee@logdna.com,michael.mansell@gmail.com"

RUN apk add --no-cache fio

VOLUME /tmp
WORKDIR /tmp

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["fio"]
