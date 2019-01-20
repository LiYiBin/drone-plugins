FROM php:7.2.14-cli-alpine

RUN wget https://getcomposer.org/download/1.7.3/composer.phar \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer

RUN apk add zip php-bcmath
