# Pinima LFS Environment

## Usage with Pinima

```sh
pinima lfs build

pinima lfs run
```

## Usage without Pinima

```sh
LFS_UID=$(id -u) LFS_GID=$(id -g) make build

LFS_DIR=/your/lfs/volume/path make run
```
