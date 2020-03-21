FROM debian:buster-slim

MAINTAINER Sagnik Sasmal, <sagnik@sagnik.me>

# Ignore APT warnings about not having a TTY
ENV DEBIAN_FRONTEND noninteractive

# Initial prep
RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get autoremove -y \
    && apt-get autoclean

# Add PHP Repo
RUN apt-get install -y apt-transport-https lsb-release ca-certificates curl \
    && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list' \
    && apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get autoremove -y \
    && apt-get autoclean

# Install PHP 7.3 and extensions
RUN apt-get install -y php7.3 \
                       php7.3-cli \
                       php7.3-gd \
                       php7.3-mysql \
                       php7.3-pdo \
                       php7.3-mbstring \
                       php7.3-tokenizer \
                       php7.3-bcmath \
                       php7.3-xml \
                       php7.3-fpm \
                       php7.3-curl \
                       php7.3-zip \
                       php7.3-gd \
                       php7.3-cgi
