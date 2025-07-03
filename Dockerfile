FROM php:7.4-fpm

USER root

# WORKDIR /var/www/html


RUN apt update && apt install -y htop nano zip curl git iputils-ping

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod uga+x /usr/local/bin/install-php-extensions && sync

RUN curl https://frankenphp.dev/install.sh | sh
RUN mv frankenphp /usr/local/bin/

# COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions \
    pdo_mysql \
    gd \
    intl \
    zip \
    opcache


RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# ganti path untuk ganti routing website /app/{folder_name_laravel}/public/
# CMD [ "frankenphp", "php-server", "-r", "/app/crud/public/" ]




