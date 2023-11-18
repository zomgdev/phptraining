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
    useradd -m -s/bin/bash www-data;\
    mkdir -p /home/www-data/project

# install php & co
RUN  \
    apt update; \
    apt install -y nginx-full; \
    apt auto-clean; \
    apt auto-remove

# starting services
RUN /usr/sbin/nginx 



