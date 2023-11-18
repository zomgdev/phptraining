FROM php:8.2-fpm-bullseye

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions
#install-php-extensions gd xdebug

# composer install
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


RUN apt-get update && \
    apt-get install -y \
		libfreetype-dev \
		libjpeg62-turbo-dev \
		libpng-dev
#	&& docker-php-ext-configure gd --with-freetype --with-jpeg \
#   && docker-php-ext-configure gd bcmath  dba grpc gnupg http imap intl ldap mailparse mcrypt oauth pgsql psr soap ssh2 uuid xdebug  xmlrpc yaml zip \
#	&& docker-php-ext-install -j$(nproc) gd bcmath  dba grpc gnupg http imap intl ldap mailparse mcrypt oauth pgsql psr soap ssh2 uuid xdebug  xmlrpc yaml zip
#
RUN install-php-extensions gd bcmath  dba grpc gnupg http imap intl ldap mailparse mcrypt oauth pgsql psr soap ssh2 uuid xdebug  xmlrpc yaml zip
