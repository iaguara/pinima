FROM iaguara/alpine
MAINTAINER Fiuza <fiuzagr@gmail.com>
LABEL description="Iaguara Asciidoctor"

RUN \
  set -eu; \
  ia_log "Asciidoctor>" "Installing packages";
    apk add --no-cache asciidoctor;

WORKDIR /data
CMD ["asciidoctor"]
