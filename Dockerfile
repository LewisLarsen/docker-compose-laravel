#FROM php:7.4-fpm-alpine
FROM php:8.0.0RC5-fpm-alpine3.12

WORKDIR /var/www/html

RUN docker-php-ext-install pdo pdo_mysql

COPY --from=composer:2.0.7 /usr/bin/composer /usr/local/bin/composer
