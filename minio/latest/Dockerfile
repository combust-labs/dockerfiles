FROM alpine:3.13

LABEL APP "minio"
LABEL APP_REPOSITORY "https://github.com/minio/minio/releases"

ENV TIMEZONE UTC
ENV MINIO_ACCESS_KEY fc-minio
ENV MINIO_SECRET_KEY fc-minio
ENV MINIO_BROWSER on

# Installing packages
RUN apk add --no-cache su-exec

# Downloading Minio
ADD https://dl.minio.io/server/minio/release/linux-amd64/minio /usr/bin/minio
RUN addgroup minio && \
    adduser -s /bin/false -G minio -S -D minio

COPY start.sh /usr/bin/start.sh

EXPOSE 9000
VOLUME [ "/data" ]

ENTRYPOINT  ["/usr/bin/start.sh"]