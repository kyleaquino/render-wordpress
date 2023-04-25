# Use an official PHP runtime as a parent image
FROM php:8.0-apache

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Copy the current directory contents into the container at /var/www/html
COPY . /var/www/html

# Install the required packages
RUN apt-get update && \
    apt-get install -y libmcrypt-dev mysql-client && \
    docker-php-ext-install mysqli pdo pdo_mysql && \
    pecl install mcrypt-1.0.3 && \
    docker-php-ext-enable mcrypt

# Set the Apache document root
ENV APACHE_DOCUMENT_ROOT /var/www/html/wordpress

# Copy the virtual host configuration file
COPY docker/apache.conf /etc/apache2/sites-available/000-default.conf

# Enable the Apache rewrite module
RUN a2enmod rewrite

# Expose port 80
EXPOSE 80

# Start the Apache server
CMD ["apache2-foreground"]
