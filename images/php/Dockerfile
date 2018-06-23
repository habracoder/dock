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
    libicu-dev \
    autoconf \
    build-essential \
    libssl-dev \
    gnupg2 \
    dirmngr

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
RUN echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/3.6 main" | tee /etc/apt/sources.list.d/mongodb-org-3.6.list
RUN apt-get update && apt-get install -y --no-install-recommends mongodb-org-tools

RUN curl --silent --show-error https://getcomposer.org/installer | php

#RUN mkdir /tmp/aerospike-client-php/ \
#    && cd /tmp/aerospike-client-php \
#    && composer require aerospike/aerospike-client-php 7.1.1 \
#    && find vendor/aerospike/aerospike-client-php -name "*.sh" -exec chmod +x {} \; \
#    && cd vendor/aerospike/aerospike-client-php/ \
#    && composer run-script post-install-cmd \
#    && cd src \
#    && make install \
#    && docker-php-ext-enable aerospike.so \
#    && rm -R /tmp/aerospike-client-php/

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

RUN docker-php-ext-install gd
RUN docker-php-ext-install pdo
RUN docker-php-ext-install soap
RUN docker-php-ext-install iconv
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install mcrypt
RUN docker-php-ext-install opcache
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install intl
RUN docker-php-ext-install sockets

ENV PHALCON_VERSION=3.2.4

RUN curl -sSL "https://codeload.github.com/phalcon/cphalcon/tar.gz/v${PHALCON_VERSION}" | tar -xz \
    && cd cphalcon-${PHALCON_VERSION}/build \
    && ./install \
    && cp ../tests/_ci/phalcon.ini $(php-config --configure-options | grep -o "with-config-file-scan-dir=\([^ ]*\)" | awk -F'=' '{print $2}') \
    && cd ../../ \
    && rm -r cphalcon-${PHALCON_VERSION}

# Permission fix
RUN usermod -u 1000 www-data