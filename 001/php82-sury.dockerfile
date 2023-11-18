FROM debian:bullseye

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Config files paths
# /etc/php/8.2/fpm/pool.d/www.conf
# /etc/php/8.2/fpm/php-fpm.conf 
# /etc/php/8.2/fpm/php.ini

# install basic prerequisites
RUN apt update; \
    apt upgrade; \
    apt install -y procps gcc wget bash curl tar; \
    apt install -y locales git apt-transport-https lsb-release ca-certificates

# settings
RUN \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen; \
    echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen; \
    locale-gen; \
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg; \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list; \
    useradd -m -s/bin/bash www-data;\
    mkdir -p /home/www-data/project; \
    mkdir -p /run/php; \
    chown www-data:www-data /run/php


# install php & co
RUN  \
    apt update; \
    apt install -y php8.2 php8.2-cli php8.2-fpm php8.2-curl php8.2-gd php8.2-bcmath php8.2-bz2 php8.2-dba php8.2-grpc php8.2-gnupg php8.2-http php8.2-imap php8.2-intl php8.2-ldap php8.2-mailparse php8.2-mbstring php8.2-mcrypt php8.2-oauth php8.2-pgsql php8.2-psr php8.2-soap php8.2-ssh2 php8.2-uuid php8.2-xdebug php8.2-xml php8.2-xmlrpc php8.2-yaml php8.2-zip ;\
    apt auto-clean; \
    apt auto-remove

# starting services
#ExecStopPost=-/usr/lib/php/php-fpm-socket-helper remove /run/php/php-fpm.sock /etc/php/8.2/fpm/pool.d/www.conf 82
#ExecReload=/bin/kill -USR2 $MAINPID
#/usr/lib/php/php-fpm-socket-helper install /run/php/php-fpm.sock /etc/php/8.2/fpm/pool.d/www.conf 82
#RUN \
#   /usr/sbin/php-fpm8.2 --nodaemonize --fpm-config /etc/php/8.2/fpm/php-fpm.conf


