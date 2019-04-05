FROM iaguara/alpine
MAINTAINER Fiuza <fiuzagr@gmail.com>
LABEL description="Iaguara LFS environment"

ARG LFS_UID="1000"
ARG LFS_GID="1000"

ENV \
  LFS="/lfs" \
  LC_ALL=POSIX

COPY rootfs/version-check.sh /

RUN \
  set -eux; \
  ia_log "LFS>" "Host system requirements"; \
    apk add --update --no-cache \
      bash \
      binutils \
      bison \
      bzip2 \
      ca-certificates \
      cdrkit \
      coreutils \
      diffutils \
      findutils \
      gawk \
      gcc \
      g++ \
      # glibc \
      grep \
      gzip \
      m4 \
      make \
      patch \
      perl \
      python3 \
      sed \
      tar \
      texinfo \
      wget \
      xz; \
  ia_log "LFS>" "Installing the glibc dependency"; \
    wget -nv \
      -O /etc/apk/keys/sgerrand.rsa.pub \
      https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub; \
    wget -nv --progress=bar:force --show-progress \
      https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk; \
    apk add glibc-2.28-r0.apk; \
    rm -rf glibc-2.28-r0.apk; \
  ia_log "LFS>" "Configuring packages"; \
    # sh > bash
    rm /bin/sh; \
    ln -s /bin/bash /bin/sh; \
    # yacc > bison
    rm /usr/bin/yacc; \
    ln -s /usr/bin/bison /usr/bin/yacc; \
    # awk > gawk
    rm /usr/bin/awk; \
    ln -s /usr/bin/gawk /usr/bin/awk; \
  ia_log "LFS>" "Checking packages version"; \
    bash -eux /version-check.sh; \
  ia_log "LFS>" "Adding the LFS user"; \
    addgroup -S lfs -g $LFS_GID; \
    adduser -S lfs -u $LFS_UID -G lfs -s /bin/bash -k /dev/null; \
    echo "lfs:lfs" | chpasswd; \
  ia_log "LFS>" "Creating link directories"; \
    # sources
    ln -sv $LFS/sources /; \
    # tools
    ln -sv $LFS/tools /; \
    # book
    ln -sv $LFS/book /;

COPY --chown=lfs:lfs ["rootfs/.bash_profile", "rootfs/.bashrc", "/home/lfs/"]

WORKDIR $LFS
ENTRYPOINT []
CMD ["bash"]
