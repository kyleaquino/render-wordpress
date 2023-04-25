# You can change this to a different version of Wordpress available at
# https://hub.docker.com/_/wordpress
FROM wordpress:6.2.0-php8.2-apache

RUN apt-get update && apt-get install -y magic-wormhole nano    

RUN usermod -s /bin/bash www-data
USER www-data:www-data
COPY --chown=www-data:www-data apache/.htaccess /var/www/html/
COPY --chown=www-data:www-data core/wordpress /var/www/html/

USER root:root
RUN echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf


CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
