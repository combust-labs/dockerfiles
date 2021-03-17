# Dockerfiles collection to build software with firebuild

[Firebuild](https://github.com/combust-labs/firebuild) is a tool to build Firecracker root file systems from Dockerfiles.  
This repository contains a selection of example Dockerfiles.

## MinIO

### Build

```sh
sudo $GOPATH/bin/firebuild rootfs \
    --profile=standard \
    --dockerfile=git+https://github.com/combust-labs/dockerfiles.git:/minio/latest/Dockerfile \
    --machine-cni-network-name=machine-builds \
    --machine-ssh-user=alpine \
    --machine-vmlinux-id=vmlinux-v5.8 \
    --resources-mem=512 \
    --tag=combust-labs/minio:latest
```

### Run

```sh
sudo $GOPATH/bin/firebuild run \
    --profile=standard \
    --from=combust-labs/minio:latest \
    --machine-cni-network-name=alpine \
    --machine-ssh-user=alpine \
    --machine-vmlinux-id=vmlinux-v5.8 \
    --identity-file=...
```

## Traefik

### Build

```sh
sudo $GOPATH/bin/firebuild rootfs \
    --profile=standard \
    --dockerfile=git+https://github.com/combust-labs/dockerfiles.git:/traefik/2.4.7/Dockerfile \
    --machine-cni-network-name=machine-builds \
    --machine-ssh-user=alpine \
    --machine-vmlinux-id=vmlinux-v5.8 \
    --resources-mem=512 \
    --tag=combust-labs/traefik:2.4.7
```

### Run

```sh
sudo $GOPATH/bin/firebuild run \
    --profile=standard \
    --from=combust-labs/traefik:2.4.7 \
    --machine-cni-network-name=alpine \
    --machine-ssh-user=alpine \
    --machine-vmlinux-id=vmlinux-v5.8 \
    --identity-file=...
```