FROM php:alpine

WORKDIR /opt/server

COPY . .

RUN apk update && apk add composer
RUN docker-php-ext-install pdo_mysql

ENV COMPOSER_ALLOW_SUPERUSER=1

EXPOSE 8000

CMD php -S 0.0.0.0:8000 -t ./public
