FROM php:7.2-fpm-alpine

# install base libraries
RUN apk update && apk upgrade && apk add \
    g++ \
    gcc \
    bash \
    zip \
    unzip \
    git \
    build-base \
    python \
    libpng-dev \
    libxml2-dev \
    libmcrypt-dev \
    icu-dev \
    autoconf \
    libmemcached-dev \
    imagemagick-dev \
    imagemagick \
    linux-headers \
    cmake \
    openssl \
    openssl-dev \
    re2c

# Kafka installation
RUN git clone https://github.com/edenhill/librdkafka.git /tmp/librdkafka \
    && cd /tmp/librdkafka \
    && ./configure \
    && make \
    && make install \
    && pecl install rdkafka-3.0.5 \
    && cd / \
    && rm -R /tmp/librdkafka/

# install build-in modules
RUN docker-php-ext-install \
    gd \
    pdo \
    intl \
    soap \
    pcntl \
    iconv \
    bcmath \
    sockets \
    opcache \
    pdo_mysql

# Install mecl modules
RUN pecl install \
    memcached-3.0.4 \
    mongodb-1.5.2 \
    imagick-3.4.3 \
    redis-4.1.1 \
    xdebug-2.6.1

RUN git clone --single-branch --depth=1 -b 4.1.10 --recursive https://github.com/aerospike/aerospike-client-c.git /tmp/aerospike-client-c \
    && cd /tmp/aerospike-client-c \
    && make --silent modules prepare libaerospike.a \
    && git clone --single-branch --depth=1 -b 7.1.2 https://github.com/aerospike/aerospike-client-php.git /tmp/aerospike-client-php \
    && cd /tmp/aerospike-client-php/src \
    && phpize \
    && ./configure --silent --enable-aerospike --enable-static --disable-shared "CFLAGS=-g -O2" \
    && make --silent install "EXTRA_INCLUDES+=-I/tmp/aerospike-client-c/target/Linux-x86_64/include" \
       "EXTRA_LDFLAGS=-Wl,-Bstatic -L/tmp/aerospike-client-c/target/Linux-x86_64/lib -laerospike -lssl -lcrypto -lrt -Wl,-Bdynamic -L/usr/lib"

RUN docker-php-ext-enable \
    memcached \
    mongodb \
    imagick \
    redis \
    xdebug \
    rdkafka \
    aerospike

# Allow Composer to be run as root
ENV COMPOSER_ALLOW_SUPERUSER 1
# Setup the Composer installer
RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
    && curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
    && php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }" \
    && php /tmp/composer-setup.php --no-ansi --install-dir=/usr/bin --filename=composer \
    && composer --ansi --version --no-interaction \
    && rm -rf /tmp/* /tmp/.htaccess

# install phalcon module
ENV PHALCON_VERSION=3.4.0
RUN curl -sSL "https://codeload.github.com/phalcon/cphalcon/tar.gz/v${PHALCON_VERSION}" | tar -xz \
    && cd cphalcon-${PHALCON_VERSION}/build \
    && ./install \
    && cp ../tests/_ci/phalcon.ini $(php-config --configure-options | grep -o "with-config-file-scan-dir=\([^ ]*\)" | awk -F'=' '{print $2}') \
    && cd ../../ \
    && rm -r cphalcon-${PHALCON_VERSION}

# Permission fix
RUN apk add shadow
RUN usermod -u 1000 www-data

ADD ./certs/* /etc/ssl/certs/
RUN update-ca-certificates

RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing gnu-libiconv
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php
