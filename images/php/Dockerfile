FROM php:7.1-fpm

ENV PHP_VERSION 7.1
ENV PHPREDIS_VERSION 3.1.4

RUN apt-get update && apt-get install -y --no-install-recommends \
    libxml2-dev \
    python \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    git \
    pkg-config \
    libmagickwand-dev \
    libmemcached-dev \
    zip \
    unzip \
    libicu-dev

# Kafka installation
RUN git clone https://github.com/edenhill/librdkafka.git /tmp/librdkafka \
    && cd /tmp/librdkafka \
    && ./configure \
    && make \
    && make install \
    && pecl install rdkafka \
    && docker-php-ext-enable rdkafka \
    && rm -R /tmp/librdkafka/

RUN pecl install redis-3.1.6 && docker-php-ext-enable redis
RUN pecl install xdebug-2.5.0 && docker-php-ext-enable xdebug
RUN pecl install imagick-3.4.3 && docker-php-ext-enable imagick
RUN pecl install memcached-3.0.4 && docker-php-ext-enable memcached
RUN pecl install mongodb-1.4.2 && docker-php-ext-enable mongodb

RUN docker-php-ext-install gd && \
    docker-php-ext-install pdo && \
    docker-php-ext-install soap && \
    docker-php-ext-install iconv && \
    docker-php-ext-install bcmath && \
    docker-php-ext-install mcrypt && \
    docker-php-ext-install opcache && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-install intl

ENV PHALCON_VERSION=3.2.4

RUN curl -sSL "https://codeload.github.com/phalcon/cphalcon/tar.gz/v${PHALCON_VERSION}" | tar -xz \
    && cd cphalcon-${PHALCON_VERSION}/build \
    && ./install \
    && cp ../tests/_ci/phalcon.ini $(php-config --configure-options | grep -o "with-config-file-scan-dir=\([^ ]*\)" | awk -F'=' '{print $2}') \
    && cd ../../ \
    && rm -r cphalcon-${PHALCON_VERSION}

# Permission fix
RUN usermod -u 1000 www-data
