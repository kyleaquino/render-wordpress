# You can change this to a different version of Wordpress available at
# https://hub.docker.com/_/wordpress
FROM wordpress:6.2.0-php8.2-apache

RUN apt-get update && apt-get install -y magic-wormhole nano    

RUN usermod -s /bin/bash www-data
USER www-data:www-data
COPY --chown=www-data:www-data apache/.htaccess /var/www/html/
USER www-data:www-data
COPY --chown=www-data:www-data wordpress-core/wordpress /var/www/html/

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
