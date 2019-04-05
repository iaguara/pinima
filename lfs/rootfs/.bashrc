set +h
umask 022

LFS="/lfs"
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/tools/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin

export LFS LC_ALL LFS_TGT PATH
