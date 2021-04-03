# Dockerfiles collection to build software with firebuild

[Firebuild](https://github.com/combust-labs/firebuild) is a tool to build Firecracker root file systems from Dockerfiles.  
This repository contains a selection of example Dockerfiles.

## etcd

### Build

```sh
sudo $GOPATH/bin/firebuild rootfs \
    --profile=standard \
    --dockerfile=git+https://github.com/combust-labs/dockerfiles.git:/etcd/3.4.0/Dockerfile \
    --cni-network-name=machine-builds \
    --vmlinux-id=vmlinux-v5.8 \
    --mem=512 \
    --tag=combust-labs/etcd:3.4.0
```

### Run

```sh
sudo $GOPATH/bin/firebuild run \
    --profile=standard \
    --from=combust-labs/etcd:3.4.0 \
    --cni-network-name=alpine \
    --vmlinux-id=vmlinux-v5.8
```

#### With SSH access

```sh
sudo $GOPATH/bin/firebuild run \
    --profile=standard \
    --from=combust-labs/etcd:3.4.0 \
    --cni-network-name=alpine \
    --vmlinux-id=vmlinux-v5.8 \
    --ssh-user=alpine \
    --identity-file=...
```

## MinIO

### Build

```sh
sudo $GOPATH/bin/firebuild rootfs \
    --profile=standard \
    --dockerfile=git+https://github.com/combust-labs/dockerfiles.git:/minio/latest/Dockerfile \
    --cni-network-name=machine-builds \
    --vmlinux-id=vmlinux-v5.8 \
    --mem=512 \
    --tag=combust-labs/minio:latest
```

### Run

```sh
sudo $GOPATH/bin/firebuild run \
    --profile=standard \
    --from=combust-labs/minio:latest \
    --cni-network-name=alpine \
    --vmlinux-id=vmlinux-v5.8
```

#### With SSH access

```sh
sudo $GOPATH/bin/firebuild run \
    --profile=standard \
    --from=combust-labs/minio:latest \
    --cni-network-name=alpine \
    --machine-vmlinux-id=vmlinux-v5.8 \
    --ssh-user=alpine \
    --identity-file=...
```

## Traefik

### Build

```sh
sudo $GOPATH/bin/firebuild rootfs \
    --profile=standard \
    --dockerfile=git+https://github.com/combust-labs/dockerfiles.git:/traefik/2.4.7/Dockerfile \
    --cni-network-name=machine-builds \
    --vmlinux-id=vmlinux-v5.8 \
    --mem=512 \
    --tag=combust-labs/traefik:2.4.7
```

### Run

```sh
sudo $GOPATH/bin/firebuild run \
    --profile=standard \
    --from=combust-labs/traefik:2.4.7 \
    --machine-cni-network-name=alpine \
    --vmlinux-id=vmlinux-v5.8
```

#### With SSH access

```sh
sudo $GOPATH/bin/firebuild run \
    --profile=standard \
    --from=combust-labs/traefik:2.4.7 \
    --cni-network-name=alpine \
    --vmlinux-id=vmlinux-v5.8 \
    --ssh-user=alpine \
    --identity-file=...
```
