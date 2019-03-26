FROM iaguara/alpine
MAINTAINER Fiuza <fiuzagr@gmail.com>
LABEL description="Iaguara You-Get"

RUN \
  set -eu; \
  ia_log "Trans>" "Installing the packages"; \
    apk add --no-cache \
      ffmpeg \
      python3 \
      rtmpdump; \
  ia_log "Trans>" "Installing You-Get"; \
# see https://you-get.org
    pip3 install you-get;
