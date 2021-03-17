FROM alpine:3.13

ENV TRAEFIK_VERSION=2.4.7

# Metadata
LABEL org.opencontainers.image.vendor="Traefik Labs" \
	org.opencontainers.image.url="https://traefik.io" \
	org.opencontainers.image.title="Traefik" \
	org.opencontainers.image.description="A modern reverse-proxy" \
	org.opencontainers.image.version="v2.4.7" \
	org.opencontainers.image.documentation="https://docs.traefik.io"

RUN apk --no-cache add ca-certificates tzdata \
    && set -ex; \
        apkArch="$(apk --print-arch)"; \
        case "$apkArch" in \
            armhf) arch='armv6' ;; \
            aarch64) arch='arm64' ;; \
            x86_64) arch='amd64' ;; \
            *) echo >&2 "error: unsupported architecture: $apkArch"; exit 1 ;; \
        esac; \
        wget --quiet -O /tmp/traefik.tar.gz "https://github.com/traefik/traefik/releases/download/v${TRAEFIK_VERSION}/traefik_v${TRAEFIK_VERSION}_linux_$arch.tar.gz"; \
        tar xzvf /tmp/traefik.tar.gz -C /usr/local/bin traefik; \
        rm -f /tmp/traefik.tar.gz; \
        chmod +x /usr/local/bin/traefik

EXPOSE 80

COPY start.sh /usr/bin/start.sh

ENTRYPOINT ["/usr/bin/start.sh"]

CMD ["traefik"]