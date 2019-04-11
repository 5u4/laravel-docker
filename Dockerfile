FROM php:alpine

WORKDIR /opt/server

COPY . .

RUN apk update && apk add composer

ENV COMPOSER_ALLOW_SUPERUSER=1

RUN composer install
RUN php artisan key:generate

EXPOSE 8000

CMD php -S 0.0.0.0:8000 -t ./public
