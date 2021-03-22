FROM alpine:3.13

ARG ETCD_VERSION=3.4.0

RUN apk add --update ca-certificates openssl tar && \
    wget https://github.com/coreos/etcd/releases/download/v${ETCD_VERSION}/etcd-v${ETCD_VERSION}-linux-amd64.tar.gz && \
    tar zxvf etcd-v${ETCD_VERSION}-linux-amd64.tar.gz && \
    mv etcd-v${ETCD_VERSION}-linux-amd64/etcd* /bin/ && \
    apk del --purge tar openssl && \
    rm -Rf etcd-v${ETCD_VERSION}-linux-amd64* /var/cache/apk/*

VOLUME /data
EXPOSE 2379 2380 4001 7001
ADD start.sh /usr/bin/start.sh
ENTRYPOINT ["/usr/bin/start.sh"]