FROM iaguara/alpine AS builder

ENV COMPILED_BY="fiuzagr" \
    BUILD_DIR=/tmp/vim \
    INSTALL_DIR=/vim \
    VIM_FILES=/vim/usr/local/share/vim/vim81 \
    RUBY_COMMAND=/usr/bin/ruby \
    PYTHON_CONFIG_DIR=/usr/lib/python2.7/config \
    PYTHON3_CONFIG_DIR=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu

ENV PACKAGES="\
build-base \
curl \
git \
gnupg \
libffi \
libffi-dev \
libx11-dev \
libxpm-dev \
libxt-dev \
lua-dev \
luajit-dev \
make \
ncurses-dev \
perl-dev \
python2-dev~=2.7 \
python3-dev~=3.6 \
ruby \
ruby-dev \
tar \
"

RUN \
  set -eu; \
  ia_log "Vim>" "Installing the packages"; \
    apk add --update --no-cache ${PACKAGES}; \
  ia_log "Vim>" "Installing the fpm"; \
    #gem update --quiet --system --no-document; \
    gem install --quiet fpm etc --no-document; \
  ia_log "Vim>" "Cloning the vim repo"; \
    git clone \
      --quiet \
      --depth=1 \
      --single-branch \
      --branch v8.1.0175 \
      https://github.com/vim/vim ${BUILD_DIR}; \
    cd ${BUILD_DIR}; \
    VIM_VERSION=$(git describe --abbrev=0 --tags); \
  ia_log "Vim>" "Configuring the installation"; \
    ./configure \
      --with-features=huge \
      --with-x \
      --enable-cscope \
      --enable-multibyte \
      --enable-perlinterp=dynamic \
      --enable-rubyinterp=dynamic \
      --enable-pythoninterp=dynamic \
      --enable-python3interp \
      --enable-luainterp \
      --enable-fontset \
      --enable-largefile \
      --enable-fail-if-missing \
      --disable-gui \
      --disable-netbeans \
      --with-luajit \
      --with-ruby-command=${RUBY_COMMAND} \
      --with-python-config-dir=${PYTHON_CONFIG_DIR} \
      --with-python3-config-dir=${PYTHON3_CONFIG_DIR} \
      --with-compiledby=${COMPILED_BY}; \
  ia_log "Vim>" "Making the installation"; \
    rm -rf ${INSTALL_DIR}; \
    make; \
    make install DESTDIR=${INSTALL_DIR}; \
    cd ${INSTALL_DIR}; \
  ia_log "Vim>" "Installing the vim-plug"; \
    mkdir -p ${VIM_FILES}/autoload; \
    chown -R 755 ${VIM_FILES}; \
  ia_log "Vim>" "Downloading vim-plug..."; \
    curl -#L -o ${VIM_FILES}/autoload/plug.vim \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; \
  ia_log "Vim>" "Generating the alpine package"; \
    fpm \
      --input-type dir \
      --output-type apk \
      --name vim \
      --version ${VIM_VERSION} \
      --no-auto-depends \
      --depends ctags \
      --depends git \
      --depends libice \
      --depends libsm \
      --depends libx11 \
      --depends libxt \
      --depends lua \
      --depends luajit \
      --depends ncurses \
      --depends php7 \
      --depends php7-common \
      --depends php7-tokenizer \
      --depends php7-phar \
      --depends php7-mbstring \
      --depends php7-json \
      --depends php7-fileinfo \
      --depends php7-simplexml \
      --depends php7-xmlwriter \
      --depends perl \
      --depends "python2~=2.7" \
      --depends "python3~=3.6" \
      --depends ruby \
      --depends nodejs \
      --depends npm \
      --depends findutils \
      --depends diffutils \
      --depends openjdk8-jre \
      .; \
    mv *.apk /;

FROM iaguara/alpine
MAINTAINER Fiuza <fiuzagr@gmail.com>
LABEL description="Latest Vim from source (+python +python3 +ruby +lua +perl) with vim-plug on Alpine Linux"

COPY --from=builder /vim*.apk /tmp/vim.apk

RUN \
  set -eu; \
  ia_log "Vim>" "Installing the build dependencies"; \
    apk add --update --no-cache --virtual build-deps \
      build-base \
      curl \
      gcc \
      make \
      musl-dev \
      python3-dev \
      ruby-dev; \
  ia_log "Vim>" "Installing the Vim package"; \
    apk add --update --no-cache --allow-untrusted /tmp/vim.apk; \
  ia_log "Vim>" "Updating pip, gem and npm"; \
    pip3 install --quiet --upgrade pip; \
    #gem update --quiet --system --no-document; \
    npm install --quiet -g npm@latest; \
  ia_log "Vim>" "Installing the Neovim"; \
    pip3 install --quiet neovim; \
  ia_log "Vim>" "Installing the linters"; \
    npm install --quiet -g eslint prettier prettier-standard stylelint alex; \
    pip3 install --quiet flake8 autopep8 vim-vint proselint gitlint; \
    gem install --quiet sqlint --no-document; \
    curl -#L -o /tmp/phpcs \
      https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar; \
    install /tmp/phpcs /usr/local/bin/phpcs; \
    curl -#L -o /tmp/phpcbf \
      https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar; \
    install /tmp/phpcbf /usr/local/bin/phpcbf; \
    curl -#L -o /tmp/php-cs-fixer \
      http://cs.sensiolabs.org/download/php-cs-fixer-v2.phar; \
    install /tmp/php-cs-fixer /usr/local/bin/php-cs-fixer; \
    curl -#L -o /tmp/ktlint \
      https://github.com/shyiko/ktlint/releases/download/0.20.0/ktlint; \
    install /tmp/ktlint /usr/local/bin/ktlint; \
  ia_log "Vim>" "Cleaning up"; \
    rm -rf /tmp/vim.apk; \
    apk del build-deps;

WORKDIR /data
CMD ["vim"]
