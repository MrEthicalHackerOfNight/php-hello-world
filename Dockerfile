FROM php:8.2-apache

RUN docker-php-ext-install mysqli

# Enable Apache modules
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Copy all files
COPY . .

# Install Composer
RUN apt-get update && apt-get install -y unzip curl \
 && curl -sS https://getcomposer.org/installer | php \
 && mv composer.phar /usr/local/bin/composer \
 && composer install

EXPOSE 80
