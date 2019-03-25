ARG NODE_VERSION=10

FROM iaguara/alpine AS ia_alpine
FROM node:${NODE_VERSION}-alpine
MAINTAINER Fiuza <fiuzagr@gmail.com>
LABEL description="Iaguara Node.js"

COPY --from=ia_alpine /usr/local/bin/ia_log /usr/local/bin/ia_log
# COPY --from=ia_alpine /usr/local/bin/ia_alpine_entrypoint /usr/local/bin/ia_alpine_entrypoint

RUN \
  set -eu; \
  ia_log "Node>" "Removing old yarn"; \
    rm -rf /usr/local/bin/yarn; \
    rm -rf /usr/local/bin/yarnpkg; \
    rm -rf /opt/yarn*; \
  ia_log "Node>" "Installing the packages"; \
    apk add --no-cache \
      autoconf \
      automake \
      g++ \
      git \
      libpng-dev \
      libtool \
      make \
      nasm \
      ncurses \
      openssh-client \
      python \
      su-exec; \
  ia_log "Node>" "Cleaning up npm cache"; \
    npm cache clean --force; \
  ia_log "Node>" "Updating npx, yarn and pnpm"; \
    npm install -g npx@latest; \
    npm install -g yarn@latest; \
    npm install -g pnpm@latest; \
    npm config set store /usr/local/pnpm;

WORKDIR /data
CMD ["node"]
