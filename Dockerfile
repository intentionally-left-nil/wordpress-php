FROM php:8.1-fpm-alpine3.18

RUN deluser www-data || true
RUN delgroup www-data || true
RUN adduser -D -u 1000 -s /bin/sh www-data

RUN set -ex && \
  apk add --update --no-cache \
  libzip-dev \
  libxml2-dev \
  libpng-dev \
  libjpeg-turbo-dev \
  mariadb-client

RUN set -ex && \
  docker-php-ext-install \
  exif \
  zip \
  gd \
  soap \
  pdo_mysql \
  mysqli \
  bcmath

RUN set -ex && \
  wget -nv -O /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
  chmod +x /usr/local/bin/wp

RUN echo '*/10  *  *  *  *  cd /var/www/html; php /var/www/html/wp-cron.php' >> /etc/crontabs/root
