FROM alpine:3.20

RUN apk add --no-cache bash procps coreutils

WORKDIR /app

COPY bin/healthcheck.sh /app/healthcheck.sh
RUN chmod +x /app/healthcheck.sh

CMD ["/app/healthcheck.sh"]
