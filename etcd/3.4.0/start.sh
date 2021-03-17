#!/bin/sh

self_ip=`ifconfig eth0 | grep 'inet addr' | cut -d: -f2 | awk '{print $1}'`

if [ -z ${ETCD_NAME+x} ]; then
    ETCD_NAME="${self_ip}"
    echo "Using default ETCD_NAME ($ETCD_NAME)"
else
    echo "Detected new ETCD_NAME value of $ETCD_NAME"
fi

if [ -z ${CLIENT_URLS+x} ]; then
    CLIENT_URLS="http://0.0.0.0:4001,http://0.0.0.0:2379"
    echo "Using default CLIENT_URLS ($CLIENT_URLS)"
else
    echo "Detected new CLIENT_URLS value of $CLIENT_URLS"
fi

if [ -z ${PEER_URLS+x} ]; then
    PEER_URLS="http://0.0.0.0:7001,http://0.0.0.0:2380"
    echo "Using default PEER_URLS ($PEER_URLS)"
else
    echo "Detected new PEER_URLS value of $PEER_URLS"
fi

if [ -z ${ADVERTISE_CLIENT_URLS+x} ]; then
    ADVERTISE_CLIENT_URLS="http://${self_ip}:2379"
    echo "Using default ADVERTISE_CLIENT_URLS ($ADVERTISE_CLIENT_URLS)"
else
    echo "Detected new ADVERTISE_CLIENT_URLS value of $ADVERTISE_CLIENT_URLS"
fi

if [ -z ${ADVERTISE_PEER_URLS+x} ]; then
    ADVERTISE_PEER_URLS="http://${self_ip}:2380"
    echo "Using default ADVERTISE_PEER_URLS ($ADVERTISE_PEER_URLS)"
else
    echo "Detected new ADVERTISE_PEER_URLS value of $ADVERTISE_PEER_URLS"
fi

if [ -z ${INITIAL_CLUSTER+x} ]; then
    INITIAL_CLUSTER="${self_ip}=http://${self_ip}:2380"
    echo "Using default INITIAL_CLUSTER ($INITIAL_CLUSTER)"
else
    echo "Detected new INITIAL_CLUSTER value of $INITIAL_CLUSTER"
fi

ETCD_CMD="/bin/etcd --logger zap --data-dir /data "
ETCD_CMD="$ETCD_CMD --name ${ETCD_NAME}"
ETCD_CMD="$ETCD_CMD --listen-peer-urls ${PEER_URLS}"
ETCD_CMD="$ETCD_CMD --listen-client-urls ${CLIENT_URLS}"
ETCD_CMD="$ETCD_CMD --initial-cluster ${INITIAL_CLUSTER}"
ETCD_CMD="$ETCD_CMD --initial-cluster-state new"
ETCD_CMD="$ETCD_CMD --initial-advertise-peer-urls ${ADVERTISE_PEER_URLS}"
ETCD_CMD="$ETCD_CMD --advertise-client-urls ${ADVERTISE_CLIENT_URLS} $*"

echo -e "Running '$ETCD_CMD'\nBEGIN ETCD OUTPUT\n"

exec $ETCD_CMD