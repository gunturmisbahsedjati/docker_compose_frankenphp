FROM php:7.4-fpm

USER root

# Install basic utilities
RUN apt update && apt install -y \
    htop \
    nano \
    zip \
    curl \
    git \
    iputils-ping

# Add PHP extension installer
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod uga+x /usr/local/bin/install-php-extensions && sync

# Install PHP extensions (including imagick)
RUN install-php-extensions \
    pdo_mysql \
    gd \
    intl \
    zip \
    opcache

# Install FrankenPHP
RUN curl https://frankenphp.dev/install.sh | sh
RUN mv frankenphp /usr/local/bin/

# Add custom PHP config
COPY php_conf.ini /usr/local/etc/php/conf.d/

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Optional: Set Laravel public path
# CMD [ "frankenphp", "php-server", "-r", "/app/crud/public/" ]
