FROM php:7.4-fpm

USER root

# Install basic utilities
RUN apt-get update && apt-get install -y \
    htop \
    nano \
    zip \
    curl \
    git \
    iputils-ping \
    && rm -rf /var/lib/apt/lists/*

# Add PHP extension installer
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions && sync

# Install PHP extensions (including imagick)
RUN install-php-extensions \
    pdo_mysql \
    gd \
    intl \
    zip \
    opcache \
    imagick

# Add custom PHP config
COPY php_conf.ini /usr/local/etc/php/conf.d/

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin --filename=composer

# Default command: run PHP-FPM
CMD ["php-fpm"]
