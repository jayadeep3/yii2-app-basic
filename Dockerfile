FROM php:8.1-fpm

RUN apt-get update && apt-get install -y \
    git unzip libpng-dev libjpeg-dev libfreetype6-dev libzip-dev \
    && docker-php-ext-install pdo pdo_mysql gd zip

WORKDIR /app
COPY src/ /app

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install

EXPOSE 8080
CMD ["php", "yii", "serve", "--host=0.0.0.0", "--port=8080"]
