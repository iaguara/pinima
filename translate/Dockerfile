FROM iaguara/alpine
MAINTAINER Fiuza <fiuzagr@gmail.com>
LABEL description="Iaguara Translate"

RUN \
  set -eu; \
  ia_log "Trans>" "Installing the packages"; \
    apk add --no-cache \
      alsa-lib \
      alsa-utils \
      aspell \
      bash \
      curl \
      espeak \
      fribidi \
      gawk \
      openssl; \
      # rlwrap; (only in the alpine:edge)  \
  ia_log "Trans>" "Installing translate-shell"; \
# see https://github.com/soimort/translate-shell
    curl -#L -o /tmp/translate "https://git.io/trans"; \
    install /tmp/translate /usr/local/bin/translate;

ENTRYPOINT [ ]
