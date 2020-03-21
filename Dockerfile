FROM php:7.3-fpm-buster

MAINTAINER Sagnik Sasmal, <sagnik@sagnik.me>

# Ignore APT warnings about not having a TTY
ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get autoremove -y \
    && apt-get autoclean \
    && apt-get install -y libcurl4-openssl-dev \
    && apt-get install -y libpng-dev \
    && apt-get install -y libxml2-dev \
    && apt-get install -y cron \
    && apt-get install -y libc-client-dev \
    && apt-get install -y libkrb5-dev
    
# Install PHP extensions
RUN docker-php-ext-install curl \
    && docker-php-ext-install gd \
    && docker-php-ext-install soap \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install iconv \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install bcmath \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install imap \
    && docker-php-ext-install curl \
    && docker-php-ext-install dom \
    && docker-php-ext-install date
