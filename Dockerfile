# You can change this to a different version of Wordpress available at
# https://hub.docker.com/_/wordpress
FROM wordpress:6.2.0-php8.0-apache

RUN apt-get update -y
RUN apt-get install --no-install-recommends -y tidy csstidy magic-wormhole nano

COPY /upload.ini /usr/local/etc/php/conf.d

RUN usermod -s /bin/bash www-data
RUN chown www-data:www-data /var/www
USER www-data:www-data

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
