# You can change this to a different version of Wordpress available at
# https://hub.docker.com/_/wordpress
FROM wordpress:6.2.0-php8.2-apache

RUN apt-get update && apt-get install -y magic-wormhole nano    
RUN echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf

COPY apache/.htaccess /var/www/html/
COPY core/wordpress /var/www/html/

RUN usermod -s /bin/bash www-data
RUN chown www-data:www-data /var/www
USER www-data:www-data

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
